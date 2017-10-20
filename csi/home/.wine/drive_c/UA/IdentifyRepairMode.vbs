dim dir
dir= session.Property("INSTALLDIR")
dim filename
filename = dir & "RepairMode.txt"
Set fs = CreateObject("Scripting.FileSystemObject")
      set a = fs.createtextfile(filename,true)
      a.writeline("RepairMode")
      a.close
   Set fs = Nothing

