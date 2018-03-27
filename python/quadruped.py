import vrep
from collections import OrderedDict 

class Quadruped():
    def __init__(self):
        vrep.simxFinish(-1) # just in case, close all opened connections
        self.clientID = vrep.simxStart('127.0.0.1',19999,True,True,5000,5) # Connect to V-REP
        self.joint_handlers = OrderedDict()
        if self.clientID == -1:
            print('Failed connecting to remote API server')
            exit(1)
            
        print('Connected to remote API server')
        
    
    def getJointHandlers(self, base_name):        
        for i in range(1, 13):
            joint_name = '{}{}'.format(base_name, i)
            _, joint_number = vrep.simxGetObjectHandle(self.clientID,
                                                    joint_name,
                                                    vrep.simx_opmode_blocking)

            self.joint_handlers[joint_name] = joint_number

    def setAllJointPosition(self, positions):
        print(self.joint_handlers)
        print(positions)
        for joint_handler in enumerate(self.joint_handlers.items()):
            i, joint_details = joint_handler
            joint_name, joint_number = joint_details
            ret = vrep.simxSetJointTargetPosition(self.clientID, joint_number, positions[i], vrep.simx_opmode_blocking)
            if ret != 0:
                print('The {} joint can\'t do this movement'.format(joint_name))
                print('Error number', ret)
            else:
                print('Joint {} going to {}'.format(joint_name, positions[i]))

    def setJointPosition(self, number, position):
        handler_numbers = list(self.joint_handlers.values())
        ret = vrep.simxSetJointTargetPosition(self.clientID, handler_numbers[number], position, vrep.simx_opmode_blocking)
        if ret != 0:
            print('The {} joint can\'t do this movement'.format(number))
        else:
            print('Joint going to', position)