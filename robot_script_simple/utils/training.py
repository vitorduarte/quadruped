from paramiko import AutoAddPolicy, SSHClient
from scp import SCPClient
from shutil import copy2
import sys

def progress(filename, size, sent):
    sys.stdout.write('%s\'s progress: %.2f%%   \r' % (filename, float(sent)/float(size)*100))
    sys.stdout.write('\x1b[2K')
    sys.stdout.write('\x1b[2K')

def create_client(ip):
        ssh = SSHClient()
        ssh.load_system_host_keys()
        ssh.set_missing_host_key_policy(AutoAddPolicy())
        ssh.connect(ip, username='root', password='12345678')
        scp = SCPClient(ssh.get_transport(), progress=progress)
        return ssh, scp

def get_options(option):
    if option == '0':
        exit(1)
    elif option == '1':
        calibration, release = 0, 1
    elif option == '2':
        calibration, release = 1, 0
    else:
        calibration, release = 0, 0

    return calibration, release

def main():
    IP_ADDRESS='192.168.1.100'
    print('Creating the ssh client...')
    ssh, scp = create_client(IP_ADDRESS)

    option = input('What you want to do now? \n\tType 0 to finish \n \tType 1 to release the legs \n \tType 2 to recalibrate\n Option:  ')

    calibration, release = get_options(option)
    while(True):
        #print(type(parameters.read()))
        parameters_file = open('../../Matlab/parameters.txt', 'r')
        parameters = parameters_file.read()

        print('Generating gait')
        command = 'cd ~/quad_vitor_pedro/robot_script_simple/utils && python3 gait_generation.py {}'.format(parameters)
        _, out, _ = ssh.exec_command(command, get_pty=True)
        print(out.read())

        print('Walking...')
        command = 'cd ~/quad_vitor_pedro/robot_script_simple/main && ./main 1 {} {}'.format(calibration, release)
        _, out, _ = ssh.exec_command(command, get_pty=True)
        print(out.read().decode())
        parameters_file.close()

        # Store the measures
        folder_name = input('Type the folder name to store the measurements: ')
        scp.get('~/quad_vitor_pedro/robot_script_simple/main/measurements' ,
                '../../Matlab/Log marchas_07-06/{}'.format(folder_name),
                recursive=True)
        copy2('../../Matlab/parameters.txt', '../../Matlab/Log marchas_07-06/{}'.format(folder_name))

        print('What you want to do now? \n\tType 0 to finish \n \tType 1 to release the legs \n \tType 2 to recalibrate\n Option:  ')
        option = input()
        calibration, release = get_options(option)


if __name__ == "__main__":
    main()