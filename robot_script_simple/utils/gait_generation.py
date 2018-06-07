import numpy as np
import sys


def inverse_kinematic(point_of_interest, degrees=False):
    """Compute the joint angles to reach a position
    Args:
        point_of_interset (float): Cordinates of point to reach with a leg
        degrees (bool): If is true return the angles in degrees
    """
    #Link size (with motor diameter)
    L2 = 11.300
    L3 = 10.844

    x_c = point_of_interest.item(0)
    y_c = point_of_interest.item(1)
    z_c = point_of_interest.item(2)

    theta_1 = np.arctan2(y_c, x_c) #First joint angle
    a = L2*np.cos(theta_1) #L2 projection in xz plane with theta_1
    b = L3*np.cos(theta_1) #L3 projection in xz plane with theta_1

    # Cosine rule to compute theta_3
    k = (-np.power(x_c, 2) - np.power(z_c,2) + np.power(a, 2) + np.power(b, 2))/(2*a*b)
    theta_3 = np.pi - np.arccos(k);

    # Compute theta_2 using trigonometry
    # theta_2: angle between L1 and L2
    p = b*np.sin(theta_3)/(a + b*np.cos(theta_3))
    theta_2 = np.arctan2(z_c,x_c) - np.arctan(p)

    if(degrees):
        return(np.array([np.rad2deg(theta_1), np.rad2deg(theta_2), np.rad2deg(theta_3)]))
    else:
        return(np.array([theta_1, theta_2, theta_3]))

def fix_mirror(angle_matrix, invert=True):
    A = np.array([1, 1, 1, -1, -1, -1, -1, -1, -1, 1, 1, 1])
    I = np.array([1, -1, -1, 1, -1, -1, 1, -1, -1, 1, -1, -1])

    A = np.tile(A,4).reshape(4,12)
    I = np.tile(I,4).reshape(4,12)

    angle_matrix = np.multiply(angle_matrix, A)

    if invert:
        return np.multiply(angle_matrix, I)
    else:
        return angle_matrix


def main():
    if len(sys.argv) != 7:
        print('Wrong usage')
        print('\nSend the kinematic parameters and the filename as parameters')
        print('\tExample: ./gait_generation 45 45 20 0 0 my_gait.txt\n')
        exit(1)
    else:
        print(sys.argv)
        try:
            angle_back = float(sys.argv[1])
            angle_front = float(sys.argv[2])
            x_pos = float(sys.argv[3])
            y_pos = float(sys.argv[4])
            z_pos = float(sys.argv[5])

        except NameError:
            print('Invalid kinetic parameters')

    np.set_printoptions(precision=4, suppress=True)
    padraocaminhada = np.matrix('3 4 1 2; 1 2 3 4;3 4 1 2;1 2 3 4')
    T = 22.144
    output_filename = '../main/gaits/{}.txt'.format(sys.argv[6])

    p1 = np.array([T, 0, 0])
    p2 = np.array([T*np.sin((np.pi/2) - (np.deg2rad(angle_back))), 0, T*np.cos((np.pi/2)- np.deg2rad(angle_back))])
    p3 = np.array([x_pos, y_pos, z_pos])
    p4 = np.array([T*np.sin((np.pi/2) - np.deg2rad(angle_front)), 0, -T*np.cos((np.pi/2) - np.deg2rad(angle_front))])
    vetor_end_points = np.matrix([p1, p2, p3, p4])

    vposes = np.zeros(shape=(4, 3))
    for i, row in enumerate(vetor_end_points):
        vposes[i] = inverse_kinematic(np.array(row), degrees=True)

    # Verify if vposes has complex numbers, in this case atribute inf to score
    if not np.isreal(vposes).all():
        score = np.array([np.inf, np.inf, np.inf])

    # Generate angle matrix
    first_exec = True
    for state in padraocaminhada:
        pose_angles = np.array([])
        for pose in np.nditer(state):
            pose_angles = np.append(pose_angles, vposes[pose-1])
        pose_angles = pose_angles.reshape(4,3)
        if first_exec:
            angle_matrix = pose_angles
            first_exec = False
            continue
        angle_matrix = np.concatenate((angle_matrix,pose_angles), axis=1)

    angle_matrix = fix_mirror(angle_matrix, invert=True)
    angle_matrix = angle_matrix*1023/300

    #TODO: Get the filename from function call
    np.savetxt(output_filename, angle_matrix.astype(int), fmt='%i')


if __name__ == "__main__":
    main()