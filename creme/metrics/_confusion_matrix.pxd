# See _confusion_matrix.pyx for implementation details.

cdef class ConfusionMatrix:
    # This confusion matrix is a 2D matrix of shape ``(n_classes, n_classes)``, corresponding
    # to a single-target (binary and multi-class) classification task.

    # Internal variables
    cdef readonly set _init_classes             # Initial set of classes
    cdef readonly set classes                   # Set of class-labels
    cdef readonly double sum_diag               # Sum across the diagonal
    cdef readonly sum_row                       # Sum per row
    cdef readonly sum_col                       # Sum per column
    cdef readonly data                          # The actual data (dictionary)
    cdef readonly n_samples                     # Number of samples seen

cdef class MultiLabelConfusionMatrix:
    # This confusion matrix corresponds to a 3D matrix of shape ``(n_labels, 2, 2)`` meaning
    # that each ``label`` has a corresponding binary ``(2x2)`` confusion matrix.

    # Internal variables
    cdef readonly set _init_labels              # Initial set of labels
    cdef readonly set labels                    # Set of labels
    cdef readonly int n_labels                  # Number of labels
    cdef readonly data                          # The actual data (3D np.ndarray)
    cdef readonly dict _label_dict              # Dictionary to map labels and their label-index
    cdef readonly int _label_idx_cnt            # Internal label-index counter
    cdef readonly n_samples                     # Number of samples seen

    # Methods
    cdef int _map_label(self, label, bint add_label)
    cdef void _add_label(self, label)
    cdef void _reshape(self)
