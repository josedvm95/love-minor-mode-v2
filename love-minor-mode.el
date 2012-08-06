;;; love-minor-mode.el --- Minor mode for working on LÖVE projects
;;;
;;; Copyright 2012 Eric James Michael Ritz
;;;     <lobbyjones@gmail.com>
;;;     <https://github.com/ejmr/love-minor-mode>
;;;
;;;
;;;
;;; License:
;;;
;;; This file is free software; you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published
;;; by the Free Software Foundation; either version 3 of the License,
;;; or (at your option) any later version.
;;;
;;; This file is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;; General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this file; if not, write to the Free Software
;;; Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
;;; 02110-1301, USA.
;;;
;;;
;;;
;;; Usage:
;;;
;;; Put this file in your Emacs lisp path (i.e. site-lisp) and add
;;; this to your `.emacs' file:
;;;
;;;     (require 'love-minor-mode)
;;;
;;; If you are working on a LÖVE project then you can enable the minor
;;; mode with the command (love-minor-mode t).  Emacs will activate
;;; the minor mode automatically if you visit a Lua buffer that
;;; contains any built-in LÖVE names.

(require 'lua-mode)

(defconst love-minor-mode-version-number "1.0"
  "The version number of the LÖVE minor mode.")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Define a customize group for LÖVE, a keymap to use, and the minor
;;; mode itself.
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defgroup love nil
  "The customization group for LÖVE minor mode."
  :prefix "love-"
  :group 'lua)

(defvar love-minor-mode-map (make-sparse-keymap)
  "A keymap for LÖVE minor mode.")

(define-minor-mode love-minor-mode
  "Toggles LÖVE minor mode."
  :init-value nil
  :lighter " LÖVE"
  :group 'love
  :keymap love-minor-mode-map)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Automatically enable LÖVE minor mode if the current buffer
;;; contains any of the built-in LÖVE callback functions or modules.
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst love/built-in-names
  (regexp-opt
   ;; Built-in Callbacks
   '("love.draw"
     "love.focus"
     "love.joystickpressed"
     "love.joystickreleased"
     "love.keypressed"
     "love.keyreleased"
     "love.load"
     "love.mousepressed"
     "love.mousereleased"
     "love.quit"
     "love.run"
     "love.update"

     ;; Standard Modules
     "love.audio"
     "love.event"
     "love.filesystem"
     "love.font"
     "love.graphics"
     "love.image"
     "love.joystick"
     "love.keyboard"
     "love.mouse"
     "love.physics"
     "love.sound"
     "love.thread"
     "love.timer"))
  "A regular expression matching built-in LÖVE callback functions
and standard modules.")

(defun love/automatically-enable ()
  "This function determines whether or not to automatically
enable `love-minor-mode'.  If the current buffer contains any
LÖVE-specific functions then we enable the minor mode."
  (if (re-search-forward love/built-in-names nil t)
      (love-minor-mode t)))

(add-hook 'lua-mode-hook 'love/automatically-enable)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; This section contains any wrap-up or clean-up code in the package
;;; before providing it for use.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'love-minor-mode)
