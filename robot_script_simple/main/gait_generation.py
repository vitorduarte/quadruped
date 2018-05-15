import numpy as np

def inverse_kinematic():
    pass

def fix_mirror(angle_matrix, invert=True):
    A = [1, 1, 1, -1, -1, -1, -1, -1, -1, 1, 1, 1]
    I = [1, -1, -1, 1, -1, -1, 1, -1, -1, 1, -1, -1]
    
def main(kinematic_parameters):
    if len(kinematic_parameters) != 5:
        print('Kinematic parameters error, should be a five elements vector')
        exit(1)
    else:
        angle_back = kinematic_parameters[0]
        angle_front = kinematic_parameters[1]
        x_pos = kinematic_parameters[2]
        y_pos = kinematic_parameters[3]
        z_pos = kinematic_parameters[4]
    
    p1 = [T 0 0]
    
if __name__ == "__main__":
    main()

