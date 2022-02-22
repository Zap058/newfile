newfile
=======

Bash script for automatically creating new files from templates, as well as inserting software licences

NOTE: This script will likely stay a work-in-progress and will likely never be production-quality. Be warned.

Examples
========

## Perl

```
#!/bin/perl -W

#     Copyright (C) 2022  Zap058
# 
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
# 
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.

use strict;
use warnings;
```

## LaTeX

```
%     Copyright (C) 2022  Zap058
% 
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.
\documentclass{article}

\usepackage{fontspec}
\usepackage{setspace}

\usepackage[backend=biber, style=apa, autocite=inline]{biblatex}
\addbibresource{<>}

\title{<>}
\author{<>}
\date{<>}

\begin{document}

\end{document}
```

TODO
====

  * Add support for licences other than GPLv3
  * Add command-line interface rather than hardcoded options
  * Add more template support
  * Add option to not include licence
