package com.example.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.Booking;
import com.example.model.Hospital;
import com.example.model.Prescription;
import com.example.model.Register;
import com.example.model.Report;
import com.example.repo.AddBooking;
import com.example.repo.AddReport;
import com.example.repo.UserAddRepo;
import com.example.repo.addPrescription;
import com.example.repo.doctorHospital;

import ch.qos.logback.core.joran.conditional.ThenOrElseActionBase;

@Controller
public class HomeController {

	@Autowired
	UserAddRepo repo;
	@Autowired
	doctorHospital doctRepo;
	@Autowired
	AddBooking addBookRepo;
	@Autowired
	addPrescription addPrescriptionRepo;
	@Autowired
	AddReport addReportRepo;
	
	@GetMapping("/")
	public String testApi() {
		return "Login.jsp";
	}
	
	@RequestMapping("register")
	public String home()
	{
		return "home.jsp";
	}
	
	@RequestMapping("/showDoctors")
	public  ModelAndView showDocters()
	{
		ModelAndView mv=new ModelAndView("showDoctors.jsp");
		Register register=repo.findById((long) 1).orElse(new Register());
		
		
		List<Register> list=repo.findByRole("D");
		mv.addObject("list",list);
		List<Hospital> hos_list=new ArrayList<Hospital>();
		for(int i=0;i<list.size();i++)
		{
		   hos_list.add(doctRepo.findByEmail(list.get(i).getEmail()));
		}
		mv.addObject("hos_list",hos_list);
		mv.addObject("resgister",register);
		System.out.println(register.getEmail());
		System.out.println(list);
		System.out.println(hos_list);
		return mv;
	}
	
	@RequestMapping("/addUser")
	public String addUser(Register newUser)
	{
		repo.save(newUser);
		return "Login.jsp";
	}
	
	@RequestMapping("/addBooking")
	public String addUser(Booking addBook,@RequestParam String date,Model model,@RequestParam String doc_email,@RequestParam String time)
	{
		
		List<Booking> list=addBookRepo.findAll();// 
		
		
		for(int i=0;i<list.size();i++)
		{
			if(list.get(i).getDoc_email().equals(doc_email))
			{
				if(((list.get(i).getDate().equals(date))&&(list.get(i).getTime().equals(time))))
				{
					model.addAttribute("status","false");
					return "/showDoctors";
				}
			}
		}
		
		model.addAttribute("status","true");
		addBook.setStatus("false");
		addBookRepo.save(addBook);
		return "/showDoctors";
	}
	
	@RequestMapping("/acceptBooking")
	public  ModelAndView acceptBooking(HttpSession session,@RequestParam int id)
	{
		Booking booking=addBookRepo.findById(id).orElse(new Booking());
		booking.setStatus("true");
		addBookRepo.save(booking);
		
		ModelAndView mv=new ModelAndView("showPatients.jsp");
		String email=(String)session.getAttribute("email");
		
		List<Booking> list=addBookRepo.findAll();
		List<Booking> list_user=new ArrayList<Booking>();
		
		for(int i=0;i<list.size();i++)
		{
			if(list.get(i).getDoc_email().equals(email))
			  list_user.add(list.get(i));
		}
		
		mv.addObject("list",list_user);
	    return mv;
		
	}
	
	@RequestMapping("/deleteBooking")
	public ModelAndView deleteBooking(HttpSession session,@RequestParam int id)
	{
		addBookRepo.deleteById(id);
		ModelAndView mv=new ModelAndView("showPatients.jsp");
		String email=(String)session.getAttribute("email");
		
		List<Booking> list=addBookRepo.findAll();
		List<Booking> list_user=new ArrayList<Booking>();
		
		for(int i=0;i<list.size();i++)
		{
			if(list.get(i).getDoc_email().equals(email))
			  list_user.add(list.get(i));
		}
		
		mv.addObject("list",list_user);
	    return mv;
		
	}
	
	@RequestMapping("/showBooking")
	public ModelAndView showBooking(HttpSession session)
	{
		String name=(String) session.getAttribute("name");
		String email=(String) session.getAttribute("email");
		System.out.println(name+"-->"+email);
		List<Booking> list=addBookRepo.findAll();
		List<Booking> list_user=new ArrayList<Booking>();
		
		for(int i=0;i<list.size();i++)
		{
			if(list.get(i).getPat_email().equals(email))
			  list_user.add(list.get(i));
		}
		ModelAndView mv=new ModelAndView("showBooking.jsp");
		mv.addObject("list",list_user);
		System.out.println(list);
		
		return mv;
	}
	
	@RequestMapping("/showReports")
	public ModelAndView showReports(HttpSession session)
	{
		String name=(String) session.getAttribute("name");
		String email=(String) session.getAttribute("email");
		System.out.println(name+"-->"+email);
		List<Report> list=addReportRepo.findAll();
		List<Report> list_user=new ArrayList<Report>();
		
		for(int i=0;i<list.size();i++)
		{
			if(list.get(i).getPat_email().equals(email))
			  list_user.add(list.get(i));
		}
		ModelAndView mv=new ModelAndView("showReports.jsp");
		mv.addObject("list",list_user);
		System.out.println(list);
		
		return mv;
	}
	@RequestMapping("/showPrescriptions")
	public ModelAndView showPrescriptions(HttpSession session)
	{
		String name=(String) session.getAttribute("name");
		String email=(String) session.getAttribute("email");
		System.out.println(name+"-->"+email);
		List<Prescription> list=addPrescriptionRepo.findAll();
		List<Prescription> list_user=new ArrayList<Prescription>();
		
		for(int i=0;i<list.size();i++)
		{
			if(list.get(i).getPat_email().equals(email))
			  list_user.add(list.get(i));
		}
		ModelAndView mv=new ModelAndView("showPrescriptions.jsp");
		mv.addObject("list",list_user);
		System.out.println(list);
		
		return mv;
	}
	
	@RequestMapping("/addPrescription")
	public ModelAndView addPrescription(HttpSession session,Prescription prep)
	{
		addPrescriptionRepo.save(prep);
		
		ModelAndView mv=new ModelAndView("showPatients.jsp");
		String email=(String)session.getAttribute("email");
		
		System.out.println(email);
		List<Booking> list=addBookRepo.findAll();
		List<Booking> list_user=new ArrayList<Booking>();
		
		for(int i=0;i<list.size();i++)
		{
			if(list.get(i).getDoc_email().equals(email))
			  list_user.add(list.get(i));
		}
		
		mv.addObject("list",list_user);
	    return mv;
		
	}
	
	@RequestMapping("/addReport")
	public ModelAndView addReport(HttpSession session,Report rept)
	{
		addReportRepo.save(rept);
		ModelAndView mv=new ModelAndView("showPatients.jsp");
		String email=(String)session.getAttribute("email");
		
		System.out.println(email);
		List<Booking> list=addBookRepo.findAll();
		List<Booking> list_user=new ArrayList<Booking>();
		
		for(int i=0;i<list.size();i++)
		{
			if(list.get(i).getDoc_email().equals(email))
			  list_user.add(list.get(i));
		}
		
		mv.addObject("list",list_user);
	    return mv;
	}
	
	@RequestMapping("/back")
	public ModelAndView backforDoctor(HttpSession session)
	{
		ModelAndView mv=new ModelAndView("showPatients.jsp");
		String email=(String)session.getAttribute("email");
		
		System.out.println(email);
		List<Booking> list=addBookRepo.findAll();
		List<Booking> list_user=new ArrayList<Booking>();
		
		for(int i=0;i<list.size();i++)
		{
			if(list.get(i).getDoc_email().equals(email))
			  list_user.add(list.get(i));
		}
		
		mv.addObject("list",list_user);
	    return mv;
		
	}
	@RequestMapping("/backP")
	public String backforPatient(HttpSession session)
	{
		return "/showDoctors";
	}
	
	@RequestMapping("/updateProfile")
	public ModelAndView updateProfile(HttpSession session,@RequestParam String username,@RequestParam String mobileno,@RequestParam String email,@RequestParam String special,@RequestParam String hos_name)
	{
		ModelAndView mv=new ModelAndView("UpdateProfile.jsp");
		String email_from_session=(String)session.getAttribute("email");
		Register register=repo.findByEmail(email_from_session);
		Hospital hospital=doctRepo.findByEmail(email_from_session);
		register.setEmail(email);
		register.setMobileno(mobileno);
		register.setUsername(username);
		hospital.setHos_name(hos_name);
		hospital.setSpecial(special);
		repo.save(register);
		doctRepo.save(hospital);
		
		mv.addObject("register",register);
		mv.addObject("hospital",hospital);
		
		return mv;
		
	}
	@RequestMapping("/updateProfileP")
	public ModelAndView updateProfileP(HttpSession session,@RequestParam String username,@RequestParam String mobileno,@RequestParam String email)
	{
		ModelAndView mv=new ModelAndView("UpdateProfileP.jsp");
		String email_from_session=(String)session.getAttribute("email");
		Register register=repo.findByEmail(email_from_session);
	//	Hospital hospital=doctRepo.findByEmail(email_from_session);
		register.setEmail(email);
		register.setMobileno(mobileno);
		register.setUsername(username);
	
		repo.save(register);
		
		mv.addObject("register",register);
		
		
		return mv;
		
	}
	
	@RequestMapping("/showProfile")
	public ModelAndView showProfile(HttpSession session)
	{
		ModelAndView mv=new ModelAndView("UpdateProfile.jsp");
		String email=(String)session.getAttribute("email");
		
		Register register=repo.findByEmail(email);
		Hospital hospital=doctRepo.findByEmail(email);
		
		mv.addObject("register",register);
		mv.addObject("hospital",hospital);
		
		return mv;
		
	}
	@RequestMapping("/showProfileP")
	public ModelAndView showProfilep(HttpSession session)
	{
		ModelAndView mv=new ModelAndView("UpdateProfileP.jsp");
		String email=(String)session.getAttribute("email");
		Register register=repo.findByEmail(email);
		
		mv.addObject("register",register);
	
		return mv;
		
	}
	
	@RequestMapping("/logout")
	public String logout()
	{
		return "Logout.jsp";
	}
	
	@RequestMapping("/userLogin")
	public ModelAndView userLogin(@RequestParam String email,@RequestParam String password,@RequestParam String role,HttpSession session)
	{
		System.out.println(email+" "+password+" "+role);
		ModelAndView mv=null;
		Register register=repo.findByEmail(email);
		if(register.getPassword().equals(password))
		{
			if(role.equals("D"))
			{
				mv=new ModelAndView("showPatients.jsp");
				mv.addObject("register",register);
				
				List<Booking> list=addBookRepo.findAll();
				List<Booking> list_user=new ArrayList<Booking>();
				
				for(int i=0;i<list.size();i++)
				{
					if(list.get(i).getDoc_email().equals(email))
					  list_user.add(list.get(i));
				}
				
				mv.addObject("list",list_user);
				session.setAttribute("name", register.getUsername());
				session.setAttribute("email", register.getEmail());
			    return mv;
			}
			else if(role.equals("P"))
			{
				mv=new ModelAndView("showDoctors.jsp");
				List<Register> list=repo.findByRole("D");
				mv.addObject("list",list);
				List<Hospital> hos_list=new ArrayList<Hospital>();
				for(int i=0;i<list.size();i++)
				{
				   hos_list.add(doctRepo.findByEmail(list.get(i).getEmail()));
				}
				mv.addObject("hos_list",hos_list);
				mv.addObject("register",register);
				session.setAttribute("name", register.getUsername());
				session.setAttribute("email", register.getEmail());
			    return mv;
				
			}
			else
			{
				mv=new ModelAndView("Login.jsp");
			    return mv;
				
			}
		}
		mv=new ModelAndView("Login.jsp");
	    return mv;
	}
	
}

