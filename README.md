# vOptSpecific: part of vOptSolver for structured problems

[![Build Status](https://travis-ci.org/vOptSolver/vOptSpecific.jl.svg?branch=master)](https://travis-ci.org/vOptSolver/vOptSpecific.jl)
[![codecov.io](http://codecov.io/github/vOptSolver/vOptSpecific.jl/coverage.svg?branch=master)](http://codecov.io/github/vOptSolver/vOptSpecific.jl?branch=master)

**vOptSolver** is a solver of multiobjective linear optimization problems (MOMIP, MOLP, MOIP, MOCO).
This repository concerns **vOptSpecific**, the part of vOptSolver devoted to **multiobjective structured problems** (currently available: 2LAP, 2OSP, 2UKP, 2UMFLP). With vOptSpecific, the problem is expressed using an Application Programming Interface. vOptSpecific runs on macOS (a C/C++ compiler has to be available on your computer), and linux-ubuntu.

This package is not provided to be installed on Windows. If you want use vOptSpecific on Windows, a C/C++ compiler has to be available on your computer, you have to compile manually the C/C++ codes as shared libraries, and to install the resulting files in the ad-hoc folder.

We suppose you are familiar with vOptSolver; if not, read first this [presentation](https://voptsolver.github.io/vOptSolver/).

###  Note 
vOptSpecific calls C/C++ codes through julia wrappers. Compilation, configuration, and installation are done automatically when the package is added to your own julia environment. These steps require none action from the user. However, some issues with the C/C++ compilation scripts on the latest versions of macOS and Linux have been reported to us recently. You may have to manually compile codes with commands set in the scripts and install the resulting shared libraries in the ad hoc folders for executing vOptSpecific. Sorry for these inconveniences. **Problem fixed (24-07-2021)**.

## Instructions 
For an use, a working version of:
- Julia must be ready; instructions for the installation are available [here](https://julialang.org/downloads/)
- your favorite C/C++ compiler must be ready (GCC is suggested)

### Run Julia

On macOS:

- locate the application `julia` and 
- click on the icon, the julia console comes to the screen

On linux:

- open a console on your computer or in the cloud
- when the prompt is ready, type in the console `julia`

### Installation Instructions

Before your first use, 
1. run Julia and when the terminal is ready with the prompt `julia` on screen, 
2. add and build as follow the mandatory package to your Julia distribution: 

```
julia> using Pkg
julia> Pkg.add("vOptSpecific")
```

That's all folk; at this point, vOptSpecific is properly installed.

### Usage Instructions

When vOptSpecific is properly installed,

1. run Julia and when the terminal is ready with the prompt `julia` on screen, 
2. invoke vOptSpecific in typing in the console:
```
julia> using vOptSpecific
```
vOptSpecific is ready. See examples for further informations and have fun with the solver!

## Problems available:

| Problem | Description                        | API           | src      | Reference      |
|:--------|:-----------------------------------|:-------------:| --------:| --------------:|
| LAP     | Linear Assignment Problem          | **2LAP2008**  | C        | Przybylski2008 |
| OSP     | One machine Scheduling Problem     | **2OSP1980**  | Julia    | Wassenhove1980 |
| UKP     | 01 Unidimensional knapsack problem | **2UKP2010**  | Julia + C  | Jorge2010 |
| UMFLP   | Uncapacitated Mixed variables Facility Location Problem |**2UMFLP2016**| C++ | Delmee2017|

## Examples 
The folder `examples` provides (1) source code of problems ready to be solved and (2) selected datafiles into different formats.

## Limitations
- The problem size for 2LAP is limited to 100x100.

## Validation 

Tested the

-    22-Jul-2021 

with

  -    Julia 1.6.2
 
on

  -    macOS 11.4 (Big Sur)
  -    Linux ubuntu 18.04.5 LTS

