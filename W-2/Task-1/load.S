.section .text
.global load
.type load, @function

load: add a4, a0, zero
      add a3, a0, zero
      add a2, a0, a1
loop: add a4, a3, a4
      add a3, a3, 1
      blt a3, a2, loop
      add a0, a4, zero
      ret
