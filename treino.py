import tensorflow as tf

x = tf.constant([[[1,2,3],[4,5,6]],[[7,8,9],[4,7,8]]],name='x')
y = tf.constant(1,name='y')
model = tf.global_variables_initializer()

with tf.Session() as session:
	session.run(model)
	print(x.shape)
	print(session.run(x))
	print('testando')