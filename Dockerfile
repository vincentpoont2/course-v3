FROM jupyter/minimal-notebook:55d5ca6be183

USER root

# Update anaconda
RUN /opt/conda/bin/conda update conda && \
    /opt/conda/bin/conda install python=3.6 anaconda

# Install dependency packages
RUN /opt/conda/bin/conda install -c fastai fastai && \
    /opt/conda/bin/conda install -c conda-forge jupyter_contrib_nbextensions && \
    /opt/conda/bin/conda install jupyter notebook nb_conda nb_conda_kernels
    
# Install missing dependencies
RUN /opt/conda/bin/conda install -c pytorch pytorch torchvision
    
USER jovyan
COPY jupyter_notebook_config.py ~/.jupyter/
