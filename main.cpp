#include <SFML/Graphics.hpp>

int main() {
    sf::RenderWindow window(sf::VideoMode(800, 600), "Simple Game");

    sf::Texture texture;
    if (!texture.loadFromFile("./texture.jpg"))
        return -1; // Error handling

    sf::Sprite sprite;
    sprite.setTexture(texture);

    sf::Vector2f velocity(0.1f, 0.1f); // Movement speed

    while (window.isOpen()) {
        sf::Event event;
        while (window.pollEvent(event)) {
            if (event.type == sf::Event::Closed)
                window.close();
        }

        // Move the sprite
        sprite.move(velocity);

        // Clear the window
        window.clear(sf::Color::Black);

        // Draw the sprite
        window.draw(sprite);

        // Display the contents of the window
        window.display();
    }

    return 0;
}
