Remove-Alias sl -F
Remove-Alias ls -F

function ls() {
  ls.exe -F --color=auto $args
}
function ll() {
  ls.exe -l --color=auto $args
}
function la() {
  ls.exe -F -a --color=auto $args
}
