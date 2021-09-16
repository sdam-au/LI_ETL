# remove old version of the venv
rm -rf ../lire_venv

# either specify some specific version of python interpreter:
INTERPRETER=/home/kasev/.local/lib/python-3.9.7/bin/python3
# or use the default interpreter: PYTHON=which python3
VENVNAME=lire_venv # select venvname virtualenv $VENVNAME --python=$PYTHON # create the environment 

virtualenv $VENVNAME --python=$INTERPRETER

$VENVNAME/bin/python -m pip --no-cache-dir install --upgrade pip test -f requirements.txt && $VENVNAME/bin/python 
-m pip install -r requirements.txt # install anything in requirements.txt
$VENVNAME/bin/python -m ipykernel install --user --name=$VENVNAME # add to kernels

