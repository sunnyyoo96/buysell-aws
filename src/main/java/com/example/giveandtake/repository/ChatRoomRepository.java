package com.example.giveandtake.repository;

import com.example.giveandtake.model.entity.ChatRoom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChatRoomRepository extends JpaRepository<ChatRoom, Long> {
   List<ChatRoom> findByRoomId(Long roomId);
   List<ChatRoom> findByRoomName(String roomName);


}
