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
	#bash("dunstify 'run pwa'")
	for i in range(30):
		time.sleep(0.5)
		after = getIDs()
		diff = list(set(after) - set(before))
		if len(diff) > 2: # don't know why but it works
			break
	print(diff)
	time.sleep(0.01)
	for id in diff:
		bash(f"xdotool windowmove {id} {x} {y} && xdotool windowactivate {id}")


if __name__ == '__main__':
	main()