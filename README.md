# Auth & Products Project

A Flutter application demonstrating **Clean Architecture**, **GraphQL Integration**, **GoRouter**, and **Infinite Scroll Pagination**.

## 🏗️ Architecture: Clean Architecture

The project follows the principles of Clean Architecture, ensuring a separation of concerns, high testability, and maintainability.

### 1. Domain Layer (Inner Layer)
This is the core of the application. It contains:
- **Entities**: Simple data objects (e.g., `Product`, `User`).
- **Repositories (Interfaces)**: Abstract definitions of what the data layer should implement.
- **Use Cases**: Specific business logic units (e.g., `GetItemsUseCase`, `LoginUseCase`).

### 2. Data Layer (Outer Layer)
This layer is responsible for data retrieval and persistence.
- **Models**: Data transfer objects (DTOs) that extend Entities and include JSON serialization (e.g., `ProductModel`).
- **Repositories (Implementations)**: Concrete implementations of the Domain Repository interfaces. They decide whether to fetch data from a remote source or a local cache.
- **Data Sources**: Low-level components that perform API calls (GraphQL) or local storage operations (SharedPreferences).

### 3. Presentation Layer (Outer Layer)
This layer handles the UI and user interactions.
- **Blocs/Cubits**: State management components that transform UI events into states.
- **Screens/Widgets**: Flutter UI components that listen to state changes and rebuild accordingly.

---

## 🔄 Data Flow

The flow of data follows a strict unidirectional pattern:

1. **User Action**: The user interacts with the UI (e.g., scrolls down to load more products).
2. **Event/Action**: The UI triggers an event in the `Bloc` (`FetchItems`) or calls a method in the `Cubit` (`loginRequested`).
3. **Use Case**: The Bloc/Cubit calls a specific `UseCase` from the Domain layer.
4. **Repository**: The Use Case calls a method on the `Repository` interface.
5. **Data Source**: The Repository implementation calls the `RemoteDataSource` (GraphQL API).
6. **API Response**: The API returns data, which is mapped into a `Model` by the Data Source.
7. **Entity Mapping**: The Repository converts the `Model` into an `Entity` and returns it to the Use Case, usually wrapped in an `Either<Failure, Entity>` for robust error handling.
8. **State Update**: The Use Case returns the result to the Bloc/Cubit, which emits a new `State`.
9. **UI Update**: The UI listens to the state change and updates the view (e.g., showing a list of products or an error message).

---

## 💉 Dependency Injection (DI)

We use `get_it` as a service locator for Dependency Injection. All dependencies are registered in `lib/injection_container.dart`.

- **Singletons**: Used for services like `SharedPreferences`, `GraphQLClient`, and `TokenService` where a single instance should persist.
- **Lazy Singletons**: Used for repositories and use cases, which are instantiated only when first needed.
- **Factories**: Used for Blocs/Cubits where a new instance might be required for different parts of the UI (though `AuthCubit` is often a singleton for global state).

**Example Registration:**
```dart
sl.registerLazySingleton<ItemRepository>(
  () => ItemRepositoryImpl(remoteDataSource: sl<ItemRemoteDataSource>()),
);
sl.registerFactory(() => ItemBloc(getItemsUseCase: sl<GetItemsUseCase>()));
```

---

## 📄 Pagination: Infinite Scroll

The project implements cursor-based pagination (Relay-style) for fetching products.

- **Mechanism**: The `allProducts` GraphQL query accepts `first` (limit) and `after` (cursor) parameters.
- **State Management**: `ItemBloc` keeps track of the `endCursor` and `hasReachedMax` flag.
- **Trigger**: The UI (using a `ScrollController`) detects when the user is near the end of the list and triggers the `FetchItems` event.
- **Throttling**: We use `throttleDroppable` from `stream_transform` to prevent spamming the server with multiple requests during rapid scrolling.

---

## 🔐 Business Logic with Cubit

While `Bloc` is used for the complex event-based product list, `Cubit` is used for **Authentication** to simplify the state management of business logic.

- **AuthCubit**: Manages global authentication state (`Authenticated`, `Unauthenticated`, `Loading`, `Error`).
- **Logic Handling**: Methods like `loginRequested` and `logoutRequested` encapsulate the business logic, interacting with use cases and updating the state based on the results.
- **Router Integration**: `GoRouter` uses `AuthCubit` to perform reactive redirects based on the user's authentication status.

---

## 🌐 Networking & Data Storage

### GraphQL Integration
- **Client**: `graphql_flutter` is used for all main data fetching.
- **Authentication**: `AuthLink` automatically attaches the JWT token to every request by retrieving it from the `TokenService`.
- **Caching**: `GraphQLCache` provides in-memory caching for faster subsequent requests.

### Local Storage
- **Token Management**: `SharedPreferences` is used to store the JWT token securely (via `TokenService`).
- **Persistence**: Upon app start, the `AuthCubit` checks for a saved token to automatically log the user in.

### Error Tracking
- **Dio Client**: A global `DioClient` is registered to handle and log network errors, with a dedicated `DioErrorBloc` to show notifications in the UI.

---

## 📈 Scalability & Maintainability

The architecture is designed to scale with the application's growth:

1. **Feature-Based Structure**: Each feature (e.g., `auth`, `items`) is self-contained with its own data, domain, and presentation layers. Adding a new feature doesn't affect existing ones.
2. **Interchangeable Components**: By using Repository interfaces, we can easily swap the data source (e.g., from GraphQL to REST or from local mock data to real API) without touching the business logic or UI.
3. **Use Cases**: Each business action is its own class, making it easy to test in isolation and reuse across different Blocs/Cubits.
4. **Mocking**: Dependencies can be easily mocked using `mockito` or `mocktail` for comprehensive unit and widget testing.

---

## 🏁 Getting Started

### 1. Setup Backend
The backend is a Node.js GraphQL server.
```bash
# In the backend directory
npm install
npm start
```

### 2. Setup Flutter App
```bash
flutter pub get
flutter run
```

## 📦 Key Dependencies
- `flutter_bloc`: State management.
- `go_router`: Declarative routing.
- `graphql_flutter`: GraphQL client.
- `get_it`: Dependency injection.
- `dartz`: Functional programming (Either).
- `easy_localization`: Multi-language support.
- `shared_preferences`: Local data persistence.
