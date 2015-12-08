(defun ascii-table ())
(defgeneric append-table (list/file table))
(defun convert-ascii (ascii table))
(defgeneric convert (driver string))

(download-table
 (dex:get "https://raw.githubusercontent.com/nathancorvussolis/corvusskk/master/installer/config-sample/config%20-%20roman.xml"))
