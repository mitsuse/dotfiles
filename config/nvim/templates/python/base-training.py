from __future__ import annotations

from pathlib import Path

from hazel.training import cli

path_dataset_root = Path(cli.required("DATASET_ROOT"))

cli.run(
    train,
    Setting(
        name="",
        training=None,
        validation=None,
        epochs=50,
        batch_size=16,
        learning_rate=0.001,
        momentum=0.9,
    ),
)
