package entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Table(name="reviews")
@Entity
public class Review {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String review;
	
	@ManyToOne
	@JoinColumn(name="reviewee_id")
	private User reviewee;
	
//	@ManyToOne
//	@Column(name="reviewer_id")
//	private User reviewer;
	
	private int rating;

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public User getReviewee() {
		return reviewee;
	}

	public void setReviewee(User reviewee) {
		this.reviewee = reviewee;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Review [id=" + id + ", review=" + review + ", reviewee=" + reviewee + ", rating=" + rating + "]";
	}
	
	
	
}
