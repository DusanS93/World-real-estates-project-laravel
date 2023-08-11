// Insert datas
const addBtn = document.getElementById("addButton");
if(addBtn != null) {
  addBtn.addEventListener("click", addDatas);
}

function addDatas(e) {
    e.preventDefault();

    const form = document.getElementById('createForm');
    const formData = new FormData(form);

    fetch("/real-estate/create", {
        method: "POST",
        // headers: {
        //     'Content-Type': 'application/json',
        //     'X-CSRF-TOKEN': csrfToken
        // },
        body: formData
    })
    .then((res) => res.json())
    .then((data) => {
        let message = document.getElementById("createMessage");
        message.innerHTML = data.message;
        message.style.display = "block";
        message.style.textAlign = "center";
        message.style.margin = "30px auto";
        message.style.fontWeight = "bold";
        message.style.border = "3px solid green";
        message.style.fontSize = "20px";
        message.style.width = "500px";
    
        console.log(data);
    })
    .catch((error) => {
        let message = document.getElementById("createMessage");
        message.innerHTML = "Error - Please check your datas!";
        message.style.display = "block";
        message.style.textAlign = "center";
        message.style.margin = "30px auto";
        message.style.fontWeight = "bold";
        message.style.border = "3px solid red";
        message.style.fontSize = "20px";
        message.style.width = "500px";

        console.log(error); 
    })
}
// End insert datas

//-----------------------------------------------

// Edit data
const editData = document.getElementById("editData");
if(editData != null) {
    editData.addEventListener("click", editDataFunc);
}

function editDataFunc(e) {
    e.preventDefault();

    const forma = document.getElementById("editForm");
    const formaPodaci = new FormData(forma);
    const paramId = formaPodaci.get('id');

    fetch('/real-estate/' + paramId + '/edit', {
        method:'POST',
        headers: {
            'X-CSRF-TOKEN': formaPodaci.get('_token')
        },
        body: formaPodaci
        // headers: {
        //     'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
        // }
    })
    .then((res) => res.json())
    .then((data) => {
        let message = document.getElementById("editMessage");
        message.classList.add('activeMessage');
        message.innerHTML = data.message;
        
        console.log(data);
    })
    .catch((err) => {
        let message = document.getElementById("editMessage");
        message.classList.add('errorMessage');
        message.innerHTML = "Error - Please check your datas!";

        console.log(err);
    });
}
// End edit data

//------------------------------------------------

// Delete datas
const deleteBtn = document.getElementById("deleteBtn");
if(deleteBtn != null) {
  deleteBtn.addEventListener("click", deleteDatas);
}

function deleteDatas(e) {
    e.preventDefault();

    const question = confirm("Do you want to delete data?");

    if(question === true) {
        const deleteForm = document.getElementById('deleteForm');
        const formData = new FormData(deleteForm);

        fetch('/real-estate/' + formData.get('id'), {
            method:'DELETE',
            headers: {
                'X-CSRF-TOKEN': formData.get('_token')
            }
        })
        .then((res) => res.json())
        .then((data) => {
            console.log(data);
            alert("You deleted ad");
            window.location.href = "/";
        })
        .catch((err) => console.log(err));
    }
    else {
        return false;
    }
}
// End delete datas