#!usr/bin/python
def mySqrt(m):
	converg=0.0000000001
	x_pre=1;
	while(True):
		x=x_pre/2+m/2/(x_pre+0.0000000001)
		cc=x-x_pre
		if(abs(x-x_pre)<converg):
			break;
		x_pre=x
		print "one loop~"

	return x
		
		
		
result=mySqrt(9)
print result