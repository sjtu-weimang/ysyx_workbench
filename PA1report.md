### 状态机
    计算 1+2+3+……+100 的有限状态机:（pc,r1,r2）

    ​ >(0,x ,x )->(1,0 ,x )->(2,0 ,0 )->(3,0 ,1 )->(4,1 ,1 )->(5,1 ,2 )->(6,3 ,2 )->(7,3 ,3 )->(8,6 ,3 )->(9,6 ,4 )->(10,10 ,4 )…依次类推（两次一循环，r2+1,r1+=r2）
#### x86
1. EFLAGS 寄存器中的 CF 位是什么意思？
CF（Carry Flag） 是 EFLAGS 寄存器中的一个标志位，用于表示无符号数运算中的进位或借位。

具体行为：

在加法运算中，如果结果的最高位产生了进位，CF 被置为 1，否则为 0。

在减法运算中，如果结果的最高位产生了借位，CF 被置为 1，否则为 0。

CF 也用于移位和循环移位指令中，表示被移出的位。

2. ModR/M 字节是什么？
ModR/M 字节 是 x86 指令编码中的一个字节，用于指定操作数的寻址模式和寄存器。

    结构：

    Mod（2 位）：指定寻址模式（寄存器直接寻址、内存寻址等）。

    Reg/Opcode（3 位）：指定寄存器或扩展操作码。

    R/M（3 位）：指定寄存器或内存操作数。

    >mov eax, ebx 
    
     ModR/M 字节为 C0，其中 Mod=11（寄存器直接寻址），Reg=000（EAX），R/M=011（EBX）。

3.  mov 指令的具体格式是怎么样的？
mov 指令 用于将数据从一个操作数复制到另一个操作数。

格式：

    mov destination, source
    操作数可以是寄存器、内存地址或立即数。

#### MIPS32

1. MIPS32 有哪几种指令格式？
MIPS32 指令集有三种基本格式：

R 型（Register）：

用于寄存器-寄存器操作。

格式：opcode (6) | rs (5) | rt (5) | rd (5) | shamt (5) | funct (6)

I 型（Immediate）：

用于立即数操作和内存访问。

格式：opcode (6) | rs (5) | rt (5) | immediate (16)

J 型（Jump）：

用于跳转指令。

>格式：opcode (6) | address (26)

2. CP0 寄存器是什么？
CP0（Coprocessor 0） 是 MIPS 架构中的系统控制协处理器，用于管理异常、中断、内存管理和系统配置。

常见的 CP0 寄存器包括：

Status：系统状态寄存器。

Cause：异常原因寄存器。

EPC：异常程序计数器，保存异常发生时的地址。

Config：系统配置寄存器。

3. 若除法指令的除数为 0，结果会怎样？
在 MIPS32 中，如果除法指令（如 div）的除数为 0，会触发一个 算术异常。

处理方式：

CPU 会跳转到异常处理程序（通常由操作系统处理）。

异常处理程序可以决定如何处理该错误（如终止程序或返回错误码）

#### riscv32

1. RISC-V32 有哪几种指令格式？
RISC-V32 指令集有六种基本格式：

R 型（Register-Register）：

>格式：opcode (7) | rd (5) | funct3 (3) | rs1 (5) | rs2 (5) | funct7 (7)

I 型（Immediate）：

>格式：opcode (7) | rd (5) | funct3 (3) | rs1 (5) | imm[11:0] (12)

S 型（Store）：

>格式：opcode (7) | imm[4:0] (5) | funct3 (3) | rs1 (5) | rs2 (5) | imm[11:5] (7)

B 型（Branch）：

>格式：opcode (7) | imm[11] (1) | imm[4:1] (4) | funct3 (3) | rs1 (5) | rs2 (5) | imm[10:5] (6) | imm[12] (1)

U 型（Upper Immediate）：

>格式：opcode (7) | rd (5) | imm[31:12] (20)

J 型（Jump）：

>格式：opcode (7) | rd (5) | imm[19:12] (8) | imm[11] (1) | imm[10:1] (10) | imm[20] (1)

2. LUI 指令的行为是什么？
LUI（Load Upper Immediate） 指令用于将一个 20 位的立即数加载到目标寄存器的高 20 位，低 12 位填充为 0。

>格式：LUI rd, imm

>行为：rd = imm << 12

示例：

>LUI x1, 0x12345：将 0x12345 左移 12 位，结果 x1 = 0x12345000。

3. mstatus 寄存器的结构是怎么样的？
mstatus 是 RISC-V 中的机器模式状态寄存器，用于控制全局中断使能、特权级别等。

主要字段：

MIE（Machine Interrupt Enable）：机器模式中断使能位。

MPIE（Machine Previous Interrupt Enable）：保存进入异常前的 MIE 值。

MPP（Machine Previous Privilege）：保存进入异常前的特权级别。

FS（Floating-Point Status）：浮点单元状态。

XS（Extension Status）：扩展单元状态。

### 统计代码行数

```
@find . \( -name "*.c" -o -name "*.h" \) -exec cat {} + | grep -c '.*'
```

find . \( -name "*.c" -o -name "*.h" \) -exec cat {} +：

使用 find 命令查找当前目录（.）及其子目录中所有 .c 和 .h 文件。

-name "*.c"：匹配所有 .c 文件。

-name "*.h"：匹配所有 .h 文件。

-o：逻辑或，表示匹配 .c 或 .h 文件。

-exec cat {} +：将找到的文件内容通过 cat 命令输出。

{} 是 find 命令的占位符，表示当前匹配的文件。

+ 表示将多个文件一次性传递给 cat 命令。

grep -c '.*'：

使用 grep 命令统计输出的行数。

'.*' 是一个正则表达式，匹配任意字符（即匹配所有行）。

-c 选项表示统计匹配的行数。