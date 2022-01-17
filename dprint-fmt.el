;;; dprint-fmt.el --- Reformat using dprint  -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Lucas Soriano

;; Author: Lucas Soriano <lucas_soriano@fastmail.com>
;; Keywords: languages
;; URL: https://github.com/luckysori/dprint-fmt
;; Package-Requires: ((emacs "24.3") (reformatter "0.3"))
;; Version: 0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Provides commands and a minor mode for reformatting files belonging
;; to a project with a `dprint' configuration.

;; This package depends on the presence of the `dprint' binary.

;; You can customise `dprint-fmt-command' if you want to specify which
;; `dprint' binary to use.

;; Enable `dprint-fmt-on-save-mode' locally to your project with a
;; form in your .dir-locals.el like this:

;;     ((nil
;;       (mode . sqlformat-on-save)))

;;; Code:

(require 'reformatter)

(defcustom dprint-fmt-command "dprint"
  "Command used for reformatting."
  :type 'string
  :group 'dprint-fmt)

(reformatter-define dprint-fmt
  :program dprint-fmt-command
  :args (list "fmt" "--stdin" input-file)
  :input-file (reformatter-temp-file-in-current-directory)
  :lighter " dprint-fmt"
  :group 'dprint-fmt)

(provide 'dprint-fmt)
;;; dprint-fmt.el ends here
