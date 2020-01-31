$(document).ready(function () {

    const reviewName = $(":text");
    const reviewEmail = $(":email");
    const reviewRating = $(":selected");
    const reviewMessage = $(":reviewmessage");
    const reviewTerms = $(":checkbox");
    const reviewsForm = $("#reviews");

    $("#reviews").on("#submit", handleFormSubmit);

    const url = window.location.search;
    const reviewId = "";
    const authorId = "";
    const updating = false;

    if (url.indexOf("?review_id=") !== -1) {
        reviewId = url.split("=")[1];
        getReviewData(reviewId, "review");
    } else if (url.indexOf("?owner_id=") !== -1) {
        authorId = url.split("=")[1];
    }

    getAuthors();

    function handleFormSubmit(event) {
        event.preventDefault();
        if (!reviewName.val().trim() || !reviewEmail.val().trim() || !reviewRating || !reviewTerms) {
            return;
        }

        const newReview = {
            name: reviewName
                .val()
                .trim(),
            email: reviewEmail
                .val()
                .trim(),
            rating: reviewRating,
            message: reviewMessage
                .val()
                .trim(),
        };

        if (updating) {
            newReview.id = reviewId;
            updateReview(newReview);
        } else {
            submitReview(newReview);
        }
    }

    function submitReview(review) {
        $.post("/api/reviews", review, function () {
            window.location.href = "/review";
        });
    }

    function getReviewData(id, type) {
        const queryUrl;
        switch (type) {
            case "review":
                queryUrl = "/api/reviews/" + id;
                break;
            case "author":
                queryUrl = "/api/Owners" + id;
                break;
            default:
                return;
        }
        $.get(queryUrl, function (data) {
            if (data) {
                console.log(data.OwnerId || data.id);
                reviewName.val(data.name);
                reviewEmail.val(data.email);
                reviewRating.val(data.rating);
                reviewMessage.val(data.message);
                updating = true;
            }
        });
    }

    

});