// Insert comments 
const commentBtn = document.getElementById("commentBtn");

const addComment = (e) => {
    e.preventDefault();

    // const id = document.getElementById("commentId").value;
    const form = document.getElementById('commentForm');
    const formData = new FormData(form);

    fetch('/real-estate/' + formData.get('commentId') + '/comment', {
        method: "POST",
        body: formData
    })
    .then((res) => res.json())
    .then((data) => {
        const noComment = document.getElementById("noComment");
        if(noComment != null) {
          noComment.remove();
        }
        const newComment = document.createElement("p");
        newComment.innerHTML = data.result.comment + " - " + data.result.user.name + " | " + data.result.created_at;
        const article = document.getElementsByClassName("commentsDiv");
        article[0].appendChild(newComment);
        let textArea = document.getElementById("commentArea");
        textArea.value = "";
        console.log(data.message);
    })
    .catch((err) => console.log(err))
}

if(commentBtn != null) {
    commentBtn.addEventListener("click", addComment);
}
// End insert comments