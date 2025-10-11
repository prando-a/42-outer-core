# libasm

## 📋 Project Overview

LibASM is an implementation of six standard C library functions written entirely in x86_64 assembly language using NASM. This project recreates essential string manipulation and I/O functions, providing a deep understanding of low-level programming and system calls.

### Implemented Functions

| Function | Description |
|----------|-------------|
| `ft_strlen` | Calculate string length |
| `ft_strcpy` | Copy string from source to destination |
| `ft_strcmp` | Compare two strings lexicographically |
| `ft_write` | Write data to file descriptor |
| `ft_read` | Read data from file descriptor |
| `ft_strdup` | Duplicate string (with malloc) |

### 🔧 Technical Specifications

- **Architecture**: x86_64
- **Assembler**: NASM (Netwide Assembler)
- **Format**: ELF64
- **Calling Convention**: System V ABI
- **Platform**: Linux
- **External Dependencies**: malloc (for ft_strdup), __errno_location (for syscalls)

## 🚀 Quick Start

### Prerequisites

```bash
# Install required tools on Ubuntu/Debian
sudo apt update
sudo apt install nasm build-essential

# Verify installation
nasm --version
gcc --version
```

### Build & Test

```bash
# Clone the repository
git clone <repository-url>
cd libasm

# Build the library
make

# Test individual functions
gcc -Wall -Wextra -Werror -no-pie main_strlen.c libasm.a -o test_strlen && ./test_strlen
gcc -Wall -Wextra -Werror -no-pie main_strcpy.c libasm.a -o test_strcpy && ./test_strcpy
gcc -Wall -Wextra -Werror -no-pie main_strcmp.c libasm.a -o test_strcmp && ./test_strcmp
gcc -Wall -Wextra -Werror -no-pie main_write.c libasm.a -o test_write && ./test_write
gcc -Wall -Wextra -Werror -no-pie main_read.c libasm.a -o test_read && ./test_read
gcc -Wall -Wextra -Werror -no-pie main_strdup.c libasm.a -o test_strdup && ./test_strdup

# Clean build files
make clean      # Remove object files
make fclean     # Remove everything
make re         # Rebuild from scratch
```

## 📁 Project Structure

```
libasm/
├── ft_strlen.s        # String length calculation
├── ft_strcpy.s        # String copy operation  
├── ft_strcmp.s        # String comparison
├── ft_write.s         # Write syscall wrapper
├── ft_read.s          # Read syscall wrapper
├── ft_strdup.s        # String duplication with malloc
├── Makefile           # Build configuration
└── README.md          # This file

```

## 🔍 Function Details

### ft_strlen
Calculates the length of a null-terminated string.
```c
size_t ft_strlen(const char *s);
```

### ft_strcpy  
Copies a string from source to destination including the null terminator.
```c
char *ft_strcpy(char *dest, const char *src);
```

### ft_strcmp
Compares two strings lexicographically. Returns negative, zero, or positive value.
```c
int ft_strcmp(const char *s1, const char *s2);
```

### ft_write
Writes up to count bytes from buffer to the file descriptor.
```c
ssize_t ft_write(int fd, const void *buf, size_t count);
```

### ft_read
Reads up to count bytes from the file descriptor into buffer.
```c
ssize_t ft_read(int fd, void *buf, size_t count);
```

### ft_strdup
Creates a duplicate of the string with dynamically allocated memory.
```c
char *ft_strdup(const char *s);
```

## 📖 Introduction

Assembly is a low-level programming language that allows direct communication with the processor. This guide will help you get started from scratch with Assembly on Linux systems (Ubuntu).

## 🛠️ Installing Tools

### Install necessary tools on Ubuntu:

```bash
# Update the system
sudo apt update

# Install NASM (Netwide Assembler)
sudo apt install nasm

# Install development tools
sudo apt install build-essential

# Install GDB for debugging (optional)
sudo apt install gdb

# Verify installation
nasm --version
```

## 🏗️ Basic Concepts

### General-purpose Registers (x86_64)
- **RAX** - Accumulator (operation results)
- **RBX** - Base (data)
- **RCX** - Counter (loops)
- **RDX** - Data
- **RSI** - Source index
- **RDI** - Destination index
- **RSP** - Stack pointer
- **RBP** - Base/frame pointer

### Register Sizes
- **64-bit**: RAX, RBX, RCX, etc.
- **32-bit**: EAX, EBX, ECX, etc. (lower 32 bits)
- **16-bit**: AX, BX, CX, etc.
- **8-bit**: AL, BL, CL, etc. (low) / AH, BH, CH, etc. (high)

### Basic Instructions
- `mov dest, src` - Move data
- `add dest, src` - Add
- `sub dest, src` - Subtract
- `mul src` - Multiply
- `div src` - Divide
- `cmp op1, op2` - Compare
- `jmp label` - Unconditional jump
- `je label` - Jump if equal
- `jne label` - Jump if not equal
- `call function` - Call function
- `ret` - Return from function

## 🔧 Build and Run

### Method 1: Assembly only
```bash
# Assemble
nasm -f elf64 file.s -o file.o

# Link
ld file.o -o file

# Run
./file
```

### Method 2: With GCC (recommended for functions)
```bash
# Assemble
nasm -f elf64 file.s -o file.o

# Link with GCC
gcc file.o -o file

# Run
./file
```

### Method 3: With Makefile
```bash
make test
```

## 📝 Basic Program Structure

### Standalone program
```assembly
section .data
    ; Initialized variables
    msg db 'Hello World', 0

section .bss
    ; Uninitialized variables
    buffer resb 256

section .text
    global _start

_start:
    ; Your code here
    
    ; Exit program
    mov rax, 60      ; syscall: sys_exit
    mov rdi, 0       ; status: 0 (success)
    syscall
```

### Function for use with C
```assembly
section .text
    global function_name

function_name:
    ; Your code here
    ret
```

## 🔄 Calling Conventions (System V ABI)

### Input parameters (first 6):
1. **RDI** - First parameter
2. **RSI** - Second parameter
3. **RDX** - Third parameter
4. **RCX** - Fourth parameter
5. **R8** - Fifth parameter
6. **R9** - Sixth parameter

### Return value:
- **RAX** - Return value

### Registers you must preserve:
- RBX, RSP, RBP, R12, R13, R14, R15

## 📋 Useful Linux Syscalls

| Number | Name | RAX | RDI | RSI | RDX |
|--------|------|-----|-----|-----|-----|
| 0 | sys_read | 0 | fd | buffer | count |
| 1 | sys_write | 1 | fd | buffer | count |
| 60 | sys_exit | 60 | status | - | - |

## 🐛 Debugging

### Using GDB:
```bash
# Assemble with debug symbols
nasm -f elf64 -g -F dwarf file.s -o file.o
gcc -g file.o -o file

# Run with GDB
gdb ./file

# Useful GDB commands:
# (gdb) break _start     - Set breakpoint
# (gdb) run              - Run
# (gdb) step             - Step
# (gdb) info registers   - Show registers
# (gdb) x/10i $rip       - Show next instructions
```

## 📊 Example: ft_strlen

```assembly
section .text
    global ft_strlen

ft_strlen:
    mov rax, 0          ; Counter = 0
    
.loop:
    cmp byte [rdi + rax], 0  ; Compare with '\0'
    je .done                 ; If '\0', finish
    inc rax                  ; Increment counter
    jmp .loop               ; Repeat
    
.done:
    ret                     ; Return (result in RAX)
```

## ⚠️ Common Errors

1. **Forgetting `ret`** - Functions must end with `ret`
2. **Not preserving registers** - Some registers must be saved
3. **Invalid memory access** - Check pointers before use
4. **Confusing sizes** - `byte`, `word`, `dword`, `qword`
5. **Incorrect syntax** - NASM uses Intel syntax, not AT&T

## 📚 Additional Resources

- [NASM Documentation](https://www.nasm.us/docs.php)
- [System V ABI](https://wiki.osdev.org/System_V_ABI)
- [Linux Syscall Table](https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/)
- [Intel x86_64 Manual](https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html)

## 💡 Optimization Tips

### Advanced techniques:
- **Loop unrolling** - Reduce iteration overhead
- **Memory alignment** - Improve access performance
- **Use SIMD registers** - For parallel operations
- **Branch prediction friendly code** - Organize code for better branch prediction

### Optimization example:
```assembly
; Basic version
.loop:
    cmp byte [rdi + rax], 0
    je .done
    inc rax
    jmp .loop

; Optimized (unrolled) version
.loop:
    cmp byte [rdi + rax], 0
    je .done
    cmp byte [rdi + rax + 1], 0
    je .done_plus_one
    cmp byte [rdi + rax + 2], 0
    je .done_plus_two
    cmp byte [rdi + rax + 3], 0
    je .done_plus_three
    add rax, 4
    jmp .loop
```

## 🧪 Testing and Validation

### Testing strategies:
1. **Unit tests** - Each function individually
2. **Edge case tests** - NULL pointers, empty strings
3. **Memory tests** - Check leaks with valgrind
4. **Performance tests** - Compare with standard implementations
5. **Integration tests** - Use multiple functions together

### Useful tools:
```bash
# Check memory leaks
valgrind --leak-check=full ./test_program

# Performance analysis
perf record ./test_program
perf report

# Test with different inputs
echo "test string" | ./test_program
```

---

