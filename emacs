(add-to-list 'load-path "~/.emacs.d/evil") ; only without ELPA/el-get
(require 'evil)
(evil-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

;; 去掉工具栏
(tool-bar-mode 0)
(menu-bar-mode 0)
(global-set-key [f9] 'menu-bar-mode)
(set-scroll-bar-mode 'right)
(setq inhibit-startup-screen nil)
(setq initial-scratch-message nil)
;; 显示当前编辑的文档
(setq frame-title-format "%b@Y.C.Gao")
;; 显示列号
(setq column-number-mode t)
(setq line-number-mode t)
;; 显示时间
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-tiem-day-and-date t)
;; 设置复制粘贴 支持emacs和外部程序的拷贝粘贴
(setq x-select-enable-clipboard t)
;; 光标靠近鼠标指针时，让鼠标指针自动让开
(mouse-avoidance-mode 'animate)
(global-font-lock-mode t)
;; 显示行号
(require 'linum)
(global-set-key [f2] 'linum-mode)
;; 字体大小
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)

;; fcitx中文支持
(global-set-key (kbd "C-SPC") 'nil)
;; 不要生成临时文件
(setq-default make-backup-files nil)
;; 写文件的编码方式
(set-buffer-file-coding-system 'utf-8)
;; 设置tab为4个空格的宽度
(setq default-tab-width 4)
;; 用空格替换tab
(setq default-indent-tabs-mode nil)

;; color-theme
;;(add-to-list 'load-path "~/.emacs.d/themes")

(add-to-list 'load-path "~/.emacs.d/plugin")
;; 使用标签页
(require 'tabbar)
(tabbar-mode 1)
;; 标签页之间的切换
(global-set-key [(ctrl h)] 'tabbar-backward)
(global-set-key [(ctrl l)] 'tabbar-forward)
(global-set-key [(ctrl q)] 'kill-this-buffer)
;; 使用sr-speedbar
(require 'sr-speedbar)
(setq speedbar-show-unknown-files t)
(global-set-key [f4] 'sr-speedbar-toggle)

;; 最大化
(defun my-maximized ()
  (interactive)
  (x-send-client-message
    nil 0 nil "_NET_WM_STATE" 32
    '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (x-send-client-message
    nil 0 nil "_NET_WM_STATE" 32
    '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
)
;; 启动时最大化
(my-maximized)

;;c语言配置
(defun gyc-c-mode-common-hook()
  (setq-default indent-tabs-mode nil)
  (setq tab-width 4 c-basic-offset 4)
  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (global-set-key [(ctrl /)] 'comment-or-uncomment-region)
  )
(add-hook 'c-mode-common-hook 'gyc-c-mode-common-hook)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (deeper-blue)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; php语言配置
(add-to-list 'load-path "~/.emacs.d/plugin")
(require 'php-mode)
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)

;; 代码折叠
(setq hs-allow-nesting t)
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'tcl-mode-hook 'hs-minor-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
(add-hook 'javascript-mode-hook 'hs-minor-mode)
(global-set-key [f1] 'hs-toggle-hiding)

