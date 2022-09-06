# R - CPP - CUDA Interfacing

This project showcases the interface of R with CPP and to CUDA.


## Requirements

In order to install this package, you need:

	- [CUDA Toolkit](https://developer.nvidia.com/cuda-downloads)
	- [R](https://www.r-project.org/)
	- [Rcpp](https://cran.r-project.org/web/packages/Rcpp/index.html)
	- [GCC](https://gcc.gnu.org/)

## Setup

In the MAKEVARS file src/ directory, adjust the following variables according to your system:

- `CUDA_HOME = /usr/local/cuda-11.7` -- Your CUDA installation directory
- `R_HOME = /home/iashraf/R/x86_64-pc-linux-gnu-library/4.1` -- Your R installation directory
- `CXX = /usr/bin/g++` -- Your gcc executable
- `PKG_CPPFLAGS = -I. -I"${CUDA_HOME}/include" -std=c++11` -- Your include libraries and flags

All the commands should be executed in the `pkgExample` directory.

Start R:

	R

Get session information:

	sessionInfo()

install Rcpp:

	install.packages("Rcpp")

load Rcpp by:

	library(Rcpp)

The following should automatically trigger, but it does not. This is espcially important when you are developing the package.

	compileAttributes("MinimalRcppCuda") 

build and install the package:

	system("R CMD build incRcpp")
	system("R CMD INSTALL incRcpp")


## Usage

Load and use the package:

	library(incRcpp)
	x <- c(1, 2, 3, 4, 5)
	y <- cppCall(x)
