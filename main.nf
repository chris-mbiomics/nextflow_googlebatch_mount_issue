params.file_path="gs://nextflow-test-bucket-1234/file"

process python_version {
    input:
    val x
    path 'input_file'

    output:
    stdout

    """
    echo $x
    ls -la
    cat $input_file
    """
}

workflow {
    python_version(Channel.of(1, 2, 3), file(params.file_path)) \
    | view
}
