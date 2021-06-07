from __future__ import annotations

from dataclasses import dataclass

import torch

from hazel.dataset import Dataset
from hazel.training.cli import Environment


Instance = None


@dataclass(frozen=True)
class Setting:
    name: str
    training: Dataset[Instance]
    validation: Dataset[Instance]
    epochs: int
    batch_size: int
    learning_rate: float
    momentum: float
    pretrained: bool


def train(setting: Setting, environment: Environment) -> None:
    import pickle

    from torch.optim import SGD
    from torch.utils.data import DataLoader
    from tqdm import tqdm

    device = (
        torch.device("cpu")
        if environment.device is None
        else torch.device(f"cuda:{environment.device}")
    )

    dataset_training = setting.training.transformed(transform)
    dataset_validation = setting.validation.transformed(transform)
    classes = setting.training.classes

    workers = 1 if environment.workers is None else environment.workers

    loader_training = DataLoader(
        dataset_training,
        batch_size=setting.batch_size,
        shuffle=True,
        num_workers=workers,
    )

    loader_validation = DataLoader(
        dataset_validation,
        batch_size=setting.batch_size,
        shuffle=False,
        num_workers=workers,
    )

    ### Prepare the network, optimizer and loss function for training.
    # network = ...
    # network.to(device)
    # optimizer = SGD(
    #     network.parameters(), lr=setting.learning_rate, momentum=setting.momentum
    # )
    # loss = ...
    # loss.to(device)

    total_training = len(dataset_training)
    total_validation = len(dataset_validation)

    for epoch in range(1, setting.epochs + 1):
        with tqdm(total=total_training) as progress_bar:
            total_loss = 0.0

            ### Enable training mode before training.
            # network.train()

            for input_, label in loader_training:
                ### Optimization
                # optimizer.zero_grad()
                # loss_ = loss(...)
                # loss_.backward()
                # total_loss += float(loss_)
                # optimizer.step()

                progress_bar.set_postfix(epoch=epoch, loss=total_loss)
                progress_bar.update(n=setting.batch_size)

            with torch.set_grad_enabled(False):
                ### Enable training mode before validation.
                # network.eval()

                for input_, label in loader_validation:
                    input_ = input_.cuda(device=device)
                    label = label.reshape((setting.batch_size,)).cuda(device=device)

            ### Show the result of validation on the progress bar.
            # progress_bar.set_postfix(epoch=epoch, loss=total_loss, accuracy=accuracy)

            ### Save the trained model every epoch.
            # model = Model(network, classes)
            # name = f"{name_model}-{setting.name}-bs_{setting.batch_size}-lr_{setting.learning_rate}-momentum_{setting.momentum}-epochs_{epoch:03}.pickle"
            # path_output = environment.output / f"{name_model}-{setting.name}"
            #
            # path_output.mkdir(parents=True, exist_ok=True)
            # with (path_output / name).open(mode="wb") as f:
            #     pickle.dump(model, f)


def transform(instance: Instance) -> Tuple[torch.Tensor, torch.Tensor]:
    ...
