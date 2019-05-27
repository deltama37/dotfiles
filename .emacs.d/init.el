;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)

;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

;; ctl+k で一行削除
(setq kill-whole-line t)

;; shebang で始まってるものに実行権限を渡す
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)