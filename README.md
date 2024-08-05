## Introduction

Hardware Description Language (HDL) is a programming language that describes the structure, behavior, and timing of electronic circuits and, most commonly, digital logic circuits. HDLs are used to design processors, motherboards, CPUs, and various other digital circuits. In addition to their use in circuit design, HDL simulates the circuit and verifies its response. Many HDLs are available, but the most popular HDLs so far are Verilog and VHDL.

> HDLs resemble a traditional programming language, but they are not identical. These are specifically designed to describe the hardware.

> Unlike traditional programming languages primarily representing serial operations, HDL distinguishes itself by representing extensive parallel operations.

There are several HDLs available, but the most popular HDLs are Verilog and VHDL.
> Verilog: Verilog stands for verification logic. It models and stimulates the Digital circuits Application-Specific Integrated Circuits (ASICs) and Field-Programmable Gate Arrays (FPGAs).

> VHDL:  VHDL stands for Very High-speed Integrated Circuit Hardware Description Language (VHSIC). It is used to design digital circuits. It is often used to design complex Digital circuits such as Microprocessors and Digital Signal Processors.

## Verilog

Verilog (Verifying Logic) is a structural and behavior language that defines four abstraction levels for implementing modules.

> [Gate level](https://vlsiverify.com/verilog/gate-level-modeling/) – The module implementation is similar to the gate-level design description in terms of logic gates and interconnections between them.

> [Dataflow level](https://vlsiverify.com/verilog/data-flow-modeling/) – The module implementation depends on data flow specification, i.e., how data flows and processes in the design circuit.

> Switch level – The module implementation requires switch-level knowledge to implement a design in terms of storage nodes and switches. This is the lowest level of abstraction.

> [Behavior level](https://vlsiverify.com/verilog/behavioral-modeling/) – The module implementation is similar to C language programming, which includes algorithmic level implementation without worrying about hardware implementation details.

## Example
1. NAND gate ([gate_nand.circ](https://github.com/brcnitk/Teaching/blob/main/Verilog/Example/gate_nand.circ), [gate_nand.v](https://github.com/brcnitk/Teaching/blob/main/Verilog/Example/gate_nand.v) and [gate_nand_tb.v](https://github.com/brcnitk/Teaching/blob/main/Verilog/Example/gate_nand_tb.v))
   
<div align="center">
<img src="https://github.com/user-attachments/assets/466e154a-24a6-4690-aa9b-580bd835ecbf">
</div>

<table>
<tr>
<td>
  
```matlab
module gate_nand(A, B, Output);
  input A, B;
  output Output;
  nand (Output, A, B);
endmodule

```
</td>
<td>
  
```matlab
module gate_nand(A, B, Output);
  input A, B;
  output Output;
  assign Output = ~(A & B);
endmodule

```
</td>
</tr>
<tr>
<td>
NAND gate: Gate-level Modelling (gate_nand.v)
</td>
<td>
NAND gate: Dataflow Modelling (gate_nand.v)
</td>
</tr>
</table>

<table>
<tr>
<td>
  
```matlab
module gate_nand(A, B, Output);
   input A, B;
   output Output;
   reg Output;
   always @ (A or B)
   begin
   if (A == 1 && B == 1)
      Output = 0;
   else
      Output = 1;
   end
endmodule

```
</td>
<td>
  
```matlab
module gate_nand_tb;
  reg A, B; wire Ouput;
  my_nand test(A, B, Output);
  initial
  begin
    A = 1'b0; B = 1'b0;
    #10 A = 1'b1;
    #10 B = 1'b1;
    #10 A = 1'b0;
    #10 $finish;
  end
  initial
  begin
    $dumpfile("gate_nand.vcd");
    $dumpvars(0, gate_nand_tb);
    $display("----NAND Gate Truth Table----");
    $display("-----------------------------");
    $display("Time input-1  input-2  output");
    $display("-----------------------------");
    $monitor("%4d    %4b      %3b      %1b", $time, A, B, Output);
  end
endmodule

```
</td>
</tr>
<tr>
<td>
NAND gate: Behavioral Modelling (gate_nand.v)
</td>
<td>
NAND gate: Testbench (gate_nand_tb.v)
</td>
</tr>
</table>

2. Half Adder ([half_adder.circ](https://github.com/brcnitk/Teaching/blob/main/Verilog/Example/half_adder.circ), [half_adder.v](https://github.com/brcnitk/Teaching/blob/main/Verilog/Example/half_adder.v) and [half_adder_tb.v](https://github.com/brcnitk/Teaching/blob/main/Verilog/Example/half_adder_tb.v))

<div align="center">
<img src="https://github.com/user-attachments/assets/587c2f4b-debf-44cb-a0d2-080ca3aff9dd">
</div>

<table>
<tr>
<td>
  
```matlab
module half_adder(A, B, Sum, C_out);
  input A, B;
  output Sum, C_out;
  wire temp;
  xor (Sum, A, B);
  nand (temp, A, B);
  not (C_out, temp);
endmodule
```
</td>
<td>
  
```matlab
module half_adder(A, B, Sum, C_out);
  input A, B;
  output Sum, C_out;
  Dataflow Modelling
  assign {C_out, Sum} = A + B;
endmodule

```
</td>
</tr>
<tr>
<td>
Half Adder: Gate-level Modelling (half_adder.v)
</td>
<td>
Half Adder: Dataflow Modelling (half_adder.v)
</td>
</tr>
</table>


<table>
<tr>
<td>
  
```matlab
module half_adder(A, B, Sum, C_out);
   input A, B;
   output Sum, C_out;
   reg Sum, C_out;
   always @ (A or B)
   begin
      if (A == 0 && B == 0)
      begin
         Sum = 0;
         C_out = 0;
      end
      else if (A == 1 && B == 1)
      begin
         Sum = 0;
         C_out = 1;
      end
      else
      begin
         Sum = 1;
         C_out = 0;
      end
   end
endmodule

```
</td>
<td>
  
```matlab
module half_adder_tb;
  reg A, B; wire Sum, C_out;
  half_adder test(A, B, Sum, C_out);
  initial
  begin
    A = 1'b0; B = 1'b0;
    #10 A = 1'b0; B = 1'b1;
    #10 A = 1'b1; B = 1'b0;
    #10 A = 1'b1; B = 1'b1;
  end
  initial
  begin
    $dumpfile("half_adder.vcd");
    $dumpvars(0, half_adder_tb);
    $display("       Half Adder     ");
    $display("----------------------");
    $display("Time  A  B  Sum  Carry");
    $display("----------------------");
    $monitor("%4d %2b %2b %3b %5b", $time, A, B, Sum, C_out);
    #50 $finish;
  end
endmodule

```
</td>
</tr>
<tr>
<td>
Half Adder: Behavioral Modelling (half_adder.v)
</td>
<td>
Half Adder: Testbench (half_adder_tb.v)
</td>
</tr>
</table>

3. Full Adder Using Half Adder ([full_adder.v](https://github.com/brcnitk/Teaching/blob/main/Verilog/Example/full_adder.v) and [full_adder_tb.v](https://github.com/brcnitk/Teaching/blob/main/Verilog/Example/full_adder_tb.v))
   
<div align="center">
<img src="https://github.com/user-attachments/assets/e88f16f9-dc44-48c5-871c-9936c1706183">
</div>

<table>
<tr>
<td>
  
```matlab
module full_adder(A, B, C_in, Sum, C_out);
   input A, B, C_in;
   output Sum, C_out;	

   wire S1, C1, C2;
   half_adder HA1(A, B, S1, C1), HA2(S1, C_in, Sum, C2);
   or (C_out, C1, C2);
endmodule

module half_adder(A, B, Sum, C_out);
   input A, B;
   output Sum, C_out;

   reg Sum, C_out;
   always @ (A or B)
   begin
      if (A == 0 && B == 0)
      begin
         Sum = 0;
         C_out = 0;
      end 
      else if (A == 1 && B == 1)
      begin
         Sum = 0;
         C_out = 1;
      end
      else
      begin
         Sum = 1;
         C_out = 0;
      end
   end
endmodule
```
</td>
<td>
  
```matlab
module full_adder_tb;
   reg A, B, C_in; wire Sum, C_out;
   full_adder test(A, B, C_in, Sum, C_out);
   initial
   begin
      A = 1'b0; B = 1'b0; C_in = 1'b0;
      #10 A = 1'b1;
      #20 B = 1'b1;
      #30 A = 1'b0;
      #50 $finish;
   end
   initial 
   begin
      $dumpfile("full_adder.vcd");
      $dumpvars(0, full_adder_tb);
      $display("         Full Adder        ");
      $display("---------------------------");
      $display("Time A  B  C_in  Sum  Carry");
      $display("---------------------------");
      $monitor("%4d %b %2b %3b %5b %4b", $time, A, B, C_in, Sum, C_out);
   end
endmodule

```
</td>
</tr>
<tr>
<td>
Full Adder: Behavioral Modelling (full_adder.v)
</td>
<td>
Full Adder: Testbench (full_adder_tb.v)
</td>
</tr>
</table>

## Verilog Code Execution
Compile (Assume the main file is gate_nand.v and the testbench is gate_nand_tb.v)
```
iverilog -o gate_nand gate_nand.v gate_nand_tb.v
```
Run the compiled executable
```
vvp gate_nand OR ./gate_nand
```
To view the output as a timing diagram (gate_nand.vcd file will be generated because of $dumpfile and $dumpvars in gate_nand_tb.v and after vvp gate_nand OR ./gate_nand)
```
gtkwave gate_nand.vcd 
```

## Reference
> [Verilog Tutorial](https://www.chipverify.com/tutorials/verilog#google_vignette)

> [Hardware Description Language](https://www.geeksforgeeks.org/hardware-description-language/)

> [Icarus Verilog in Ubuntu](https://medium.com/@0xYori/installing-icarus-verilog-and-gtkwave-on-ubuntu-for-verilog-simulation-d6d31eee2096)
