package service;

public class Login {
	private MemberInter memberInter;
	private Member member;
	private Admin admin;
	
	public MemberInter getMemberInter() {
		return memberInter;
	}
	public void setMemberInter(MemberInter memberInter) {
		this.memberInter = memberInter;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	
	
}
