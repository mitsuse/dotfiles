from __future__ import annotations

from typing import Any
from typing import Sequence

from dataclasses import dataclass


@dataclass(frozen=True)
class Arguments:
    ...


def main() -> None:
    import sys

    arguments = parse(sys.argv[1:])


def parse(args: Sequence[str]) -> Arguments:
    from argparse import ArgumentParser

    parser = ArgumentParser()

    result = parser.parse_args(args)

    return Arguments()


if __name__ == "__main__":
    main()
