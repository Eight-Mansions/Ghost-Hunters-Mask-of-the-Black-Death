"""
Copies the given file to a new location with Unix newlines enforced

"""
import os
import sys
from pathlib import Path

if len(sys.argv) < 3:
    print("Usage: <file_to_copy> <output_folder>")
    exit()

file_to_copy = sys.argv[1]
output_folder = sys.argv[2]

file_path = Path(file_to_copy)

with open(file_path, "r", encoding="shift-jis") as input_file, open(os.path.join(output_folder, file_path.name), "w",
                                                                    newline="\r", encoding="shift-jis") as output_file:
    output_file.writelines(input_file.readlines())
