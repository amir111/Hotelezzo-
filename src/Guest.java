import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.SystemColor;
import java.awt.Color;

public class Guest extends JFrame {

	private JPanel contentPane;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Guest frame = new Guest();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}
	
	public void close() {
		this.setVisible(false);
		this.dispose();
}

	/**
	 * Create the frame.
	 */
	public Guest() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 774, 476);
		contentPane = new JPanel();
		contentPane.setBackground(SystemColor.activeCaption);
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblGuetProtfolio = new JLabel("Guest Protfolio");
		lblGuetProtfolio.setFont(new Font("Berlin Sans FB Demi", Font.PLAIN, 90));
		lblGuetProtfolio.setBounds(62, 0, 744, 92);
		contentPane.add(lblGuetProtfolio);
		
		JLabel lblGuestName = new JLabel("Guest Name");
		lblGuestName.setFont(new Font("Arial Black", Font.PLAIN, 20));
		lblGuestName.setBounds(62, 107, 143, 55);
		contentPane.add(lblGuestName);
		
		JLabel lblEmailAddress = new JLabel("Email Address");
		lblEmailAddress.setFont(new Font("Arial Black", Font.PLAIN, 20));
		lblEmailAddress.setBounds(62, 176, 170, 55);
		contentPane.add(lblEmailAddress);
		
		JLabel lblChangePassword = new JLabel("Change Password ");
		lblChangePassword.setFont(new Font("Arial Black", Font.PLAIN, 20));
		lblChangePassword.setBounds(62, 262, 221, 26);
		contentPane.add(lblChangePassword);
		
		JButton btnBookingInfo = new JButton("Booking Info");
		btnBookingInfo.setFont(new Font("Arial Black", Font.PLAIN, 20));
		btnBookingInfo.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				//Guest.Dispose();
				bookingInfo bookinfo = new bookingInfo();
				bookinfo.setVisible(true);
				close();
				
				
			}
		});
		btnBookingInfo.setBounds(513, 113, 177, 49);
		contentPane.add(btnBookingInfo);
		
		JButton btnBookRoom = new JButton("Book Room");
		btnBookRoom.setFont(new Font("Arial Black", Font.PLAIN, 20));
		btnBookRoom.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				searchRoom sroom = new searchRoom();
				sroom.setVisible(true);
				close();
				
			}
			
		});
		btnBookRoom.setBounds(513, 198, 177, 49);
		contentPane.add(btnBookRoom);
		
		JButton btnRequest = new JButton("Request");
		btnRequest.setFont(new Font("Arial Black", Font.PLAIN, 20));
		btnRequest.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				guestRequest greq = new guestRequest();
				greq.setVisible(true);
				close();
			}
		});
		btnRequest.setBounds(513, 277, 177, 49);
		contentPane.add(btnRequest);
		
		JButton btnLogout = new JButton("Close Application");
		btnLogout.setForeground(Color.RED);
		btnLogout.setFont(new Font("Arial Black", Font.PLAIN, 20));
		btnLogout.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				Login mainscreen = new Login();
				mainscreen.setVisible(true);
				close();
				
			}
		});
		btnLogout.setBounds(245, 345, 232, 60);
		contentPane.add(btnLogout);
		
		JPanel panel = new JPanel();
		panel.setBounds(62, 154, 210, 26);
		contentPane.add(panel);
		
		JPanel panel_1 = new JPanel();
		panel_1.setBounds(62, 223, 210, 26);
		contentPane.add(panel_1);
		
		JPanel panel_2 = new JPanel();
		panel_2.setBounds(62, 301, 210, 26);
		contentPane.add(panel_2);
	}
}