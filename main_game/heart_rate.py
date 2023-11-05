from godot import exposed, export
from godot import *
import heartpy as hp

@exposed

data = [72,73,75,74,76,78,80,82,85,86]

wd, m = hp.process(data,sample_rate=100)

print("Heart Rate:" m['bpm'])
