#!/usr/bin/env python3

from ppcgrader.cli import cli
import ppccp

if __name__ == "__main__":
    cli(ppccp.Config(single_precision=True, gpu=True))
