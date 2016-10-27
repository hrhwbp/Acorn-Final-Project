package com.remind.model;

import org.springframework.stereotype.Component;

import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

@Component
public class ParserDao implements ParserDaoInter {

	public ArrayList<ParserDto> getData(String bean) {

		ArrayList<ParserDto> list = new ArrayList<ParserDto>();
		try {
			ParserDto dto = new ParserDto();

			Document doc = Jsoup.connect(bean).get(); // "view-source:" +
			
			//Elements classelem = doc.select("[class*=tit]");
			//Elements idelem = doc.select("[id*=Tit]");
			Elements titleelem = doc.select("title");
			Elements priceelem = doc.select("[class*=price]"); // span[id*=price]
			Elements imageelem = doc.select("[id*=Image] [src$=jpg]");// [src$=jpg]
			Elements imageelem2 = doc.select("[id*=img] [src$=jpg]");
			
			Element irum = null;
			Element cost = null;
			Element image = null;
			
			System.out.println(titleelem.text() + "$$$$$");
			
			//상품명 Parsing	
			if( !titleelem.get(0).attr("title").toString().equals(null)){
				//classelem.get(i).attr("class").toString().equals(doc.select("[class*=produ]").get(j).attr("class").toString())
				
				//System.out.println(titleelem.get(0).text() + "~~~!~!~!");
				irum = titleelem.get(0);
				dto.setName(irum.text());
			}
			
			//상품 가격 Parsing
			for (int j = 0; j < priceelem.size(); j++) {
				if((!priceelem.get(j).attr("class").toString().equals(null) || 
						!priceelem.get(j).equals(null))){
					
					cost = priceelem.get(j);
					if(dto.getPrice()==null){
						System.out.println("없음");
						System.out.println(cost.text());
						dto.setPrice(cost.text());	
					}else{
						System.out.println("있음");
					}
				}
			}
			
			
			
			if(imageelem.size() > 0){
				for (int i = 0; i < imageelem.size(); i++) {
					if( !imageelem.get(i).attr("id").toString().equals(null) ||
							!imageelem.get(i).equals(null)
							){
						
						//imageelem.get(i).attr("src").toString();
						image = imageelem.get(i);
						System.out.println(imageelem.get(i).attr("src").toString() + "~~~!~!~!");
						
						if(dto.getImage()==null){
							System.out.println("이미지 없음");
							System.out.println(image.text());
							dto.setImage(imageelem.get(i).attr("src").toString());
						}else{
							System.out.println("이미지 있음");
						}
					}
				}
				
			}else{
				for (int i = 0; i < imageelem2.size(); i++) {
					if( !imageelem2.get(i).attr("id").toString().equals(null) ||
							!imageelem2.get(i).equals(null)
							){
						
						//imageelem.get(i).attr("src").toString();
						image = imageelem2.get(i);
						System.out.println(imageelem2.get(i).attr("src").toString() + "~~~!~!~!");
						
						if(dto.getImage()==null){
							System.out.println("이미지 없음");
							System.out.println(image.text());
							dto.setImage(imageelem2.get(i).attr("src").toString());
						}else{
							System.out.println("이미지 있음");
						}
					}
				}
			}
				
			
			
			
			
			
			
		
			
			
			/*for (Element celem:classelem) {											//attribute에 class가 있는 테그 모조리 classelem에 입력
				for(Element eelem:nameelem ){										//attribute에 name가 있는 테그 모조리 nameelem에 입력
					if (celem.attr("class").equals(celem.attr("[class*=tit]")) ||
							celem.attr("class").equals(celem.attr("[class*=produ]")) || 
							eelem.attr("name").equals(eelem.attr("[name*=item]"))
							) {
						
						
						celem.attr("class", celem.attr("[class*=tit]"));
						
						System.out.println(celem.text());
						
						if(eelem.attr("name").equals(eelem.attr("[name*=item]"))){
							
							celem.attr("class", celem.attr("[class*=tit]"));
							eelem.attr("name", eelem.attr("[name*=item])"));
							System.out.println(celem);
							System.out.println(eelem);
						}
					}
				}
				
			}*/
			
			list.add(dto);
			System.out.println(dto.getName() + "~~~~" + dto.getPrice() + " " + dto.getImage());

		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

}
