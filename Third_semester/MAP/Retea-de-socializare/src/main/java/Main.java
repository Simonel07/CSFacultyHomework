import domain.constants.RepoStrategy;
import domain.FriendShip;
import domain.User;
import domain.validators.FriendshipValidator;
import domain.validators.UserValidator;
import repository.Repository;
import repository.memory.InMemoryRepository;
import repository.file.UserFile;
import repository.file.FriendshipFile;
import service.Service;
import service.Service0;
import ui.ConsoleUI;
import ui.UI;

import java.util.UUID;

public class Main {
    public static void main(String[] args) {

        Repository<UUID, User> userRepo;
        Repository<UUID, FriendShip> friendshipRepo;

        //file:
        userRepo = new UserFile("user.txt", new UserValidator());
        friendshipRepo = new FriendshipFile("friendship.txt", new FriendshipValidator(), userRepo);

        //in memory:
        //userRepo = new InMemoryRepository<>(new UserValidator());
        //friendshipRepo = new InMemoryRepository<>(new FriendshipValidator());

        Service srv = new Service0(userRepo, friendshipRepo);

        UI console = new ConsoleUI(srv);

        console.start();
    }
}


