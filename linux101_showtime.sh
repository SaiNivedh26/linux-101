#!/bin/bash

# --- COLORS ---
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

clear

echo -e "${CYAN}=========================================================="
echo -e "          LINUX 101: THE ULTIMATE SHOWTIME MODE           "
echo -e "==========================================================${NC}"
sleep 1

echo -e "${YELLOW}Status:${NC} Upgrading from 'User' to 'System Architect'..."
sleep 1
echo -e "${GREEN}Ready.${NC}"
echo
read -p "Press [Enter] to breach the matrix..."

# --- MODULE 1: THE SIMULATION ---
clear
echo -e "${CYAN}===== MODULE 1: THE SIMULATION (VIRTUALIZATION) =====${NC}"
echo -e "${YELLOW}Logic:${NC} Is the OS aware it's running on 'fake' hardware?"
sleep 1

echo -n "Detecting Hypervisor: "
VIRT=$(systemd-detect-virt)
echo -e "${GREEN}$VIRT${NC}"

echo -n "CPU Virtualization Flags (VMX/SVM): "
FLAGS=$(egrep -c '(vmx|svm)' /proc/cpuinfo)
if [ "$FLAGS" -gt 0 ]; then
    echo -e "${GREEN}$FLAGS (Capable)${NC}"
else
    echo -e "${RED}0 (Passthrough/Nested disabled)${NC}"
fi
echo
read -p "Next: The DNA vs. The Suit..."

# --- MODULE 2: KERNEL VS DISTRO ---
clear
echo -e "${CYAN}===== MODULE 2: DNA vs. THE SUIT (LINUX ≠ UBUNTU) =====${NC}"
echo -e "${YELLOW}Logic:${NC} Different clothes (Distro), same engine (Kernel)."
sleep 1

echo -e "Kernel DNA: ${GREEN}$(uname -smr)${NC}"
echo -e "Distro Identity:"
if [ -f /etc/os-release ]; then
    grep -E '^(PRETTY_NAME|ID)=' /etc/os-release | sed 's/"//g' | sed 's/^/  /'
fi
echo
read -p "Next: The Hypervisor Stack..."

# --- MODULE 3: THE HYPERVISOR STACK ---
clear
echo -e "${CYAN}===== MODULE 3: THE STACK (KVM & QEMU) =====${NC}"
echo -e "${YELLOW}Logic:${NC} How Linux acts as a landlord for other OSs."
sleep 1

echo -n "KVM Kernel Module: "
if lsmod | grep -q kvm; then
    echo -e "${GREEN}LOADED (This system can host VMs)${NC}"
else
    echo -e "${RED}NOT LOADED${NC}"
fi

echo -n "Active QEMU Emulators: "
QEMU_PROC=$(ps aux | grep qemu | grep -v grep | wc -l)
if [ "$QEMU_PROC" -gt 0 ]; then
    echo -e "${GREEN}$QEMU_PROC processes found${NC}"
else
    echo -e "${YELLOW}None (No guest VMs currently running)${NC}"
fi
echo
read -p "Next: Hardware Allocation..."

# --- MODULE 4: HARDWARE ---
clear
echo -e "${CYAN}===== MODULE 4: HARDWARE ALLOCATION =====${NC}"
echo -e "${YELLOW}Logic:${NC} What the Kernel sees and manages."
sleep 1

echo -e "${GREEN}CPU Cores:${NC} $(nproc)"
echo -e "${GREEN}Memory Status:${NC}"
free -h | awk 'NR==1 || NR==2'
echo -e "${GREEN}Storage Devices:${NC}"
lsblk -n -o NAME,SIZE,TYPE,MOUNTPOINT | grep -v "loop"
echo
read -p "Next: The Powerhouse (GPU)..."

# --- MODULE 5: THE POWERHOUSE (GPU) ---
clear
echo -e "${CYAN}===== MODULE 5: THE POWERHOUSE (GPU PASSTHROUGH) =====${NC}"
echo -e "${YELLOW}Logic:${NC} Testing if the Virtual Machine has access to 'Raw Power'."
sleep 1

echo -e "Detecting Graphics Hardware:"
if lspci 2>/dev/null | grep -iE 'vga|3d|nvidia' > /dev/null; then
    lspci | grep -iE 'vga|3d|nvidia' | sed 's/^/  /'
elif [ -d /dev/dxg ] || command -v nvidia-smi &> /dev/null; then
    echo -e "${GREEN}  WSLg/DirectX Driver Detected (vGPU Active)${NC}"
else
    echo -e "${RED}  No Dedicated GPU Detected in this layer.${NC}"
fi
echo
read -p "Next: The Genesis Process (PID 1)..."

# --- MODULE 6: PID 1 ---
clear
echo -e "${CYAN}===== MODULE 6: THE GENESIS PROCESS (PID 1) =====${NC}"
echo -e "${YELLOW}Logic:${NC} In Linux, life begins at 1. Everything else is a child.${NC}"
sleep 1

echo -e "Process ID 1 Name: ${GREEN}$(cat /proc/1/comm)${NC}"
echo -e "Process Tree (The Ancestry):"
pstree -p | head -15
echo
sleep 1
echo -e "${YELLOW}Note:${NC} If you kill PID 1, the universe ends (Kernel Panic)."
echo
read -p "Finish the Demo..."

# --- EXIT ---
clear
echo -e "${CYAN}=========================================================="
echo -e "${GREEN}            DEMO COMPLETE: SYSTEM UNDERSTOOD            "
echo -e "${CYAN}==========================================================${NC}"
echo "Key Lessons:"
echo "1. The Kernel is the engine."
echo "2. The Distro is the UI/Tools."
echo "3. Virtualization is just layers of lying to the hardware."
echo "4. Everything is a file. Everything is a process."
echo
echo -e "${YELLOW}YOU AIN'T JUST USERS ANYMORE.${NC}"
echo -e "${CYAN}==========================================================${NC}"
