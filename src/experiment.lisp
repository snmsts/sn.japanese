(defun asciitable ())
(defgeneric append-asciitable (list/file table))
(defun convert-ascii (ascii table))
(defgeneric convert (driver string))

(ql:quickload '(:dexador :plump))

(defvar *prefix*  #.(asdf:system-relative-pathname
                     :sn.japanese
                     #p"table/"))
(defvar *roman-table-uri*
  "https://raw.githubusercontent.com/nathancorvussolis/corvusskk/master/installer/config-sample/config%20-%20roman.xml")
(defvar *downolad-table-method* 'download-corvusskk)


(defun download-corvusskk (&optional (uri *roman-table-uri*))
  (let* ((kana-list (find "kana" (plump:get-elements-by-tag-name (plump:parse (dex:get uri)) "section")
                          :key (lambda (x) (plump:attribute x "name")) :test 'equal))
         (rows (plump:get-elements-by-tag-name kana-list "row")))
    (list "hiragana" (mapcar (lambda (x)
                               (let ((i (parse-integer(plump:attribute x "so"))))
                                 (list (plump:attribute x "ro")
                                       (subseq (plump:attribute x "ro") (-(length (plump:attribute x "ro")) i))
                                       (plump:attribute x "hi"))))
                             rows)
          "katakana" (mapcar (lambda (x)
                               (let ((i (parse-integer(plump:attribute x "so"))))
                                 (list (plump:attribute x "ro")
                                       (subseq (plump:attribute x "ro") (-(length (plump:attribute x "ro")) i))  
                                       (plump:attribute x "ka"))))
                             rows)
          "hankaku" (mapcar (lambda (x)
                              (let ((i (parse-integer(plump:attribute x "so"))))
                                (list (plump:attribute x "ro")
                                      (subseq (plump:attribute x "ro") (-(length (plump:attribute x "ro")) i))
                                      (plump:attribute x "an"))))
                            rows))))

(defun serialize-downloaded (table &key (prefix *prefix*))
  )
