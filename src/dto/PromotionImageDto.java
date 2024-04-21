package dto;


public class PromotionImageDto {
	
		private int idx;
		private String sellerId;
		private String imageF;
		private String subject;
		private int onOff;
		public PromotionImageDto(int idx, String sellerId, String imageF, String subject, int onOff) {
			super();
			this.idx = idx;
			this.sellerId = sellerId;
			this.imageF = imageF;
			this.subject = subject;
			this.onOff = onOff;
		}
		public int getIdx() {
			return idx;
		}
		public void setIdx(int idx) {
			this.idx = idx;
		}
		public String getSellerId() {
			return sellerId;
		}
		public void setSellerId(String sellerId) {
			this.sellerId = sellerId;
		}
		public String getImageF() {
			return imageF;
		}
		public void setImageF(String imageF) {
			this.imageF = imageF;
		}
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
		public int getOnOff() {
			return onOff;
		}
		public void setOnOff(int onOff) {
			this.onOff = onOff;
		}
		
		
		

		
	}

