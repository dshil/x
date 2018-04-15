# History

The development was begun because of the inspiration from the following
resources:

* Series of boot loader development articles:
    * https://www.codeproject.com/Articles/664165/Writing-a-boot-loader-in-Assembly-and-C-Part
    * https://www.codeproject.com/Articles/668422/Writing-a-boot-loader-in-Assembly-and-C-Part
    * https://www.codeproject.com/Articles/737545/Writing-a-bit-dummy-kernel-in-C-Cplusplus
* OS development series:
    * http://www.brokenthorn.com/Resources/OSDevIndex.html


# Tests

Bochs X86 emulator is used for tests purpose during the development.
For building bochs from scratch use helpers scripts under the `scripts`
directory. For more information about bochs configurations option
visit: http://bochs.sourceforge.net/doc/docbook/user/compiling.html .

## Boot loader for floppy disk

* The executable code should be placed into RAM to address `0x7c00`.
* The boot sector must contains master boot record identified by the two
  bytes signature: 0x55 0xaa for 510 and 511 bytes respectively.
* The boot loader code must fit into 512 bytes of boot sector.