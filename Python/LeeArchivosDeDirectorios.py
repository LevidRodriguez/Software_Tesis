#!/usr/bin/python
# encoding: latin1
from pathlib2 import Path
import os

def main():
    print "Lee los archivos de un directorio en particular"
    path = '../ImagenesTest/'
    lst_files_png = []
    lst = ls(path)

    for lst_files in lst:
        (file_name, file_extension) = os.path.splitext(lst_files)
        if file_extension == ".png":
            lst_files_png.append(file_name+file_extension)
            # print(file_name+file_extension)
            pass
        pass
    print lst_files_png
    pass


def ls(ruta = Path.cwd()):
    return [arch.name for arch in Path(ruta).iterdir() if arch.is_file()]
    pass


if __name__ == '__main__':
    main()
    pass
