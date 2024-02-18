function [Energy_node_norm]=Energy_norm(Energy)
colmin = min(Energy);
colmax = max(Energy);
Energy_node_norm = rescale(Energy,'InputMin',colmin,'InputMax',colmax);