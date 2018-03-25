from quadruped import Quadruped

quadruped = Quadruped()
quadruped.getJointHandlers('Jmotor')

# Set all joint positions to 0
#quadruped.setAllJointPosition([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    
# Set position of one joint 
quadruped.setJointPosition(0, -90)
