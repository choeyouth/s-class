package TennisAPP;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStreamReader;

public class TennisDAO {
	
	private final String PLAYERPATH = ".\\dat\\dummy.txt";
	private final String SCOREPATH = ".\\dat\\scoreboard.txt";
	private final String RESULT = ".\\dat\\result.txt";
	
	public void addPlayer(TennisDTO dto) {
		
		
		try {
			// 성별,이름 순서 더미 파일 순서로 수정  
			BufferedWriter writer = new BufferedWriter(new FileWriter(PLAYERPATH,true));
			String line = String.format("%s,%s,%d세\n", dto.getName(), dto.getGender(), dto.getAge());
			
			writer.write(line);
			
			
			writer.close();
			
			
		} catch (Exception e) {
			System.out.println("TennisDAO.add");
			e.printStackTrace();
		}
		
	}
	
	
	public void getPlayer(TennisDTO dto) {
		
		
		
	}
	
	
	public TennisDTO get(String name) {
		
		try {
			BufferedReader reader = new BufferedReader(new FileReader(PLAYERPATH));
			
			String line = null;
			
			while((line = reader.readLine())!=null) {
				
				if(line.startsWith(name)) {
					
					String[] temp = line.split(",");
					
					TennisDTO dto = new TennisDTO();
				
					//아무개,남,11세 
					dto.setName(temp[0]);
					dto.setGender(temp[1]);
					dto.setAge(temp[2]);
					
					return dto;
				}
			}
			
			
			
		} catch (Exception e) {
			System.out.println("TennisDAO.get");
			e.printStackTrace();
		}
		
		
		
		return null;
		
	}
	
	
	
	
	
	
	
	

}























