import os, subprocess, sys, time

def bash(cmd, read=False):
	if read:
		try:
			x = subprocess.check_output(cmd, shell=True).decode("utf-8")
		except:
			x = False
		return x
	else:
		os.system(cmd)
		return 

def getIDs():
	ret = bash("xdotool search --class ffpwa", read=True)
	if type(ret) == str:
		ret = ret.strip().split("\n")
	else:
		ret = []
	return ret
	

def main():
	cmd = sys.argv[1]
	x, y = sys.argv[2], sys.argv[3]
	before = getIDs()
	bash(cmd)
	for i in range(30):
		time.sleep(0.1)
		after = getIDs()
		diff = list(set(after) - set(before))
		if len(diff) > 3: # don't know why but it works
			break
	print(diff)
	for id in diff:
		bash(f"xdotool windowmove {id} {x} {y}")


if __name__ == '__main__':
	main()