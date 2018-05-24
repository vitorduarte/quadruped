from paramiko import AutoAddPolicy, SSHClient
from scp import SCPClient

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

def main():
    IP_ADDRESS='192.168.1.100'
    parameters = open('../../Matlab/parameters.txt', 'r')
    ssh, scp = create_client(IP_ADDRESS)

    #print(type(parameters.read()))
    parameters = parameters.read()

    command = 'cd ~/quad_vitor_pedro/robot_script_simple/utils && python3 gait_generation.py {}'.format(parameters)
    _, out, _ = ssh.exec_command(command, get_pty=True)
    print(out.read())
    command = 'cd ~/quad_vitor_pedro/robot_script_simple/main && ./main 1'
    _, out, _ = ssh.exec_command(command, get_pty=True)
    print(out.read())


if __name__ == "__main__":
    main()