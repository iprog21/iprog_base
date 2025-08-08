# IprogBase

Base service/command class using the Template Method Pattern.

Provides a reusable, extensible base class for service or command objects in Ruby applications, following the Template Method Pattern. Includes lifecycle hooks for parameter handling, static data setup, error checking, data processing, and response filtering. Designed for clean, maintainable, and testable business logic.

<img src="https://github.com/IPROG-TECH/media-files/blob/main/iprogtech-logo.png" width="150" alt="IPROG TECH" align="right" />

This gem is provided by [**IPROG TECH**](https://www.iprog.tech/), an information technology company specializing in web development services using Ruby on Rails. IPROG TECH also offers free programming tutorials.

**Providing Good Quality Web Services:**
- Startup
- Maintenance
- Upgrading & Conversion


<a href="https://www.buymeacoffee.com/iprog21" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

## Usage

```ruby
class UserService < Iprog::Base
  def set_params_data
    set :first_name, params.dig(:first_name)
    set :last_name, params.dig(:last_name)
  end

  def filtered_fields
    [:greet]
  end

  def process_data
    set :greet, "Hello #{@first_name} #{@last_name}"
  end
end

user_service = UserService.call(first_name: "Jhon", last_name: "Doe")

if user_service.success?
  puts user_service.result[:greet]
else
  puts user_service.errors
end
```
