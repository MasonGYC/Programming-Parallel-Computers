#!/usr/bin/env python3

from ppcgrader.cli import cli
import ppcis

if __name__ == "__main__":
    cli(ppcis.Config(openmp=True))
