<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/froala-editor@latest/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
</head>

<body>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/froala-editor@latest/js/froala_editor.pkgd.min.js"></script>

<div class="sample">
<h2>Image Upload Example</h2>
<form action="{{ route('editor.store') }}" method="POST" enctype="multipart/form-data">
    @csrf <!-- Include CSRF token -->
    <label for="title">Title:</label>
    <input type="text" name="title" id="title" placeholder="Enter title">
    <br><br> <!-- Add spacing between elements -->
    <label for="content">Content:</label> <!-- Add a label for better accessibility -->
    <textarea id="edit" name="content"></textarea>
    <br><br> <!-- Add spacing between elements -->
    <hr>
    <button type="submit">Submit</button>
</form>

</div>

<script>
new FroalaEditor('#edit', {
    imageUploadParam: 'image_param',
    imageUploadURL: '{{ route('imageUpload') }}',
    imageUploadMethod: 'post',
    height: 200,
    imageUploadParams: {
        froala: 'true',
        _token: '{{ csrf_token() }}'
    }
});
</script>
</body>
</html>
